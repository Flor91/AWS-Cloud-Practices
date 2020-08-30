/* SSH key pair */
resource "aws_key_pair" "aiouti_ecs" {
  key_name   = var.key_name
  public_key = file(var.key_file)
}

/**
 * Launch configuration used by autoscaling group
 */
resource "aws_launch_configuration" "aiouti_ecs" {
  name     = "aiouti_ecs"
  image_id = var.ami

  instance_type        = var.instance_type
  key_name             = aws_key_pair.aiouti_ecs.key_name
  iam_instance_profile = aws_iam_instance_profile.aiouti_ecs.name
  user_data            = template_file.user_data.rendered
}

/**
 * Autoscaling group.
 */
resource "aws_autoscaling_group" "aiouti_ecs" {
  name                 = "aiouti-ecs-asg"
  availability_zones   = var.availability_zones
  launch_configuration = aws_launch_configuration.aiouti_ecs.name

  min_size         = 3
  max_size         = 10
  desired_capacity = 5
}

/* ecs service cluster */
resource "aws_ecs_cluster" "aiouti_default" {
  name = var.ecs_cluster_name
}

