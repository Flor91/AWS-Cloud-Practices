resource "aws_cloudwatch_log_group" "aiouti-device" {
  name              = "aiouti-device"
  retention_in_days = 1
}

/* container and task definitions for running the actual Docker registry */
resource "aws_ecs_service" "aiouti_device_service" {
  name            = "aiouti-device"
  cluster         = aws_ecs_cluster.aiouti_default.id

  task_definition = aws_ecs_task_definition.aiouti_device.arn
  desired_count   = 5
  depends_on      = [aws_iam_role_policy.aiouti_ecs_service_role_policy]

}

resource "aws_ecs_task_definition" "aiouti_device" {
  family                = "aiouti_device"
  volume {
    host_path = "/home/ec2-user/cert"
    name = "certificatesvol"
  }
  container_definitions = template_file.registry_task.rendered
}

