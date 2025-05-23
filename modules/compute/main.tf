resource "aws_launch_template" "web" {
  name_prefix   = "${var.env}-web"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
    security_groups             = var.security_groups
  }

  user_data = base64encode(var.user_data)
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 1
  vpc_zone_identifier  = var.subnets
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "${var.env}-web"
    propagate_at_launch = true
  }
}
