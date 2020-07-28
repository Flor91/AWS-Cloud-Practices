resource "aws_cloudwatch_log_group" "greengrass-A" {
  name              = "greengrass-A"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "greengrass-A" {
  family = "greengrass-A"

  container_definitions = <<EOF
[
  {
    "name": "greengrass-A",
    "image": "amazon/aws-iot-greengrass",
    "cpu": 0,
    "memory": 128,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "eu-west-1",
        "awslogs-group": "greengrass-A",
        "awslogs-stream-prefix": "complete-ecs"
      }
    }
  }
]
EOF
}

resource "aws_ecs_service" "greengrass-A" {
  name            = "greengrass-A"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.greengrass-A.arn

  desired_count = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}
