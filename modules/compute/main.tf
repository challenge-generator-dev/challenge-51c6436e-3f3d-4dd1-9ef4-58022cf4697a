# Módulo de configuración de cómputo para el servicio de notificaciones
# Proporciona instancias EC2, security groups y componentes de cómputo relacionados

# Security Group para las instancias del servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.project_name}-${var.environment}-compute-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = var.vpc_id

  # Tráfico entrante permitido
  dynamic "ingress" {
    for_each = var.allowed_inbound_cidrs
    content {
      from_port   = var.service_port
      to_port     = var.service_port
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
      description = "Allow inbound traffic on service port"
    }
  }

  # Tráfico saliente permitido
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-notifications-sg"
    }
  )
}

# Security Group para ELB (si está habilitado)
resource "aws_security_group" "elb" {
  count = var.enable_elb ? 1 : 0

  name        = "${var.project_name}-${var.environment}-elb-sg"
  description = "Security group para el balanceador de carga"
  vpc_id      = var.vpc_id

  # Tráfico HTTP entrante
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_inbound_cidrs
    description = "Allow HTTP inbound"
  }

  # Tráfico HTTPS entrante
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_inbound_cidrs
    description = "Allow HTTPS inbound"
  }

  # Tráfico saliente hacia las instancias
  egress {
    from_port       = var.service_port
    to_port         = var.service_port
    protocol        = "tcp"
    security_groups = [aws_security_group.notifications.id]
    description     = "Allow traffic to service instances"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-elb-sg"
    }
  )
}

# Instancias EC2 para el servicio de notificaciones
resource "aws_instance" "notifications" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [aws_security_group.notifications.id]
  key_name               = var.key_name
  user_data              = var.user_data

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.encrypt_root_volume
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-notifications-${count.index + 1}"
    }
  )
}

# Optional: Application Load Balancer
resource "aws_lb" "main" {
  count = var.enable_elb ? 1 : 0

  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb[0].id]
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-alb"
    }
  )
}

# Target Group para el ALB
resource "aws_lb_target_group" "main" {
  count = var.enable_elb ? 1 : 0

  name     = "${var.project_name}-${var.environment}-tg"
  port     = var.service_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = var.health_check_path
    matcher             = "200"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-tg"
    }
  )
}

# Listener para el ALB
resource "aws_lb_listener" "http" {
  count = var.enable_elb ? 1 : 0

  load_balancer_arn = aws_lb.main[0].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[0].arn
  }
}

# Attachment de instancias al Target Group
resource "aws_lb_target_group_attachment" "main" {
  count = var.enable_elb ? var.instance_count : 0

  target_group_arn = aws_lb_target_group.main[0].arn
  target_id        = aws_instance.notifications[count.index].id
  port             = var.service_port
}

# Auto Scaling Group (opcional)
resource "aws_autoscaling_group" "main" {
  count = var.enable_autoscaling ? 1 : 0

  name                = "${var.project_name}-${var.environment}-asg"
  vpc_zone_identifier = var.subnet_ids
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity   = var.desired_capacity
  health_check_type   = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.main[0].id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-asg-instance"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

# Launch Template para ASG
resource "aws_launch_template" "main" {
  count = var.enable_autoscaling ? 1 : 0

  name_prefix   = "${var.project_name}-${var.environment}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = base64encode(var.user_data)

  vpc_security_group_ids = [aws_security_group.notifications.id]

  monitoring {
    enabled = true
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.encrypt_root_volume
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,
      {
        Name = "${var.project_name}-${var.environment}-lt-instance"
      }
    )
  }

  lifecycle {
    create_before_destroy = true
  }
}