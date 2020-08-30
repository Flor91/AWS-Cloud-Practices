/* template files for registry and ecs role policies */
resource "template_file" "device_policy" {
  template = file("modules/ecs-cluster/policies/device-policy.json")
}

resource "template_file" "ecs_service_role_policy" {
  template = file("modules/ecs-cluster/policies/ecs-service-role-policy.json")

  vars = {
    s3_bucket_name = var.s3_bucket_name
  }
}

resource "template_file" "registry_task" {
  template = file("modules/ecs-cluster/task-definitions/device-task-definition.json")

  vars = {
    aiouti_iot_core_uri   = var.aiouti_iot_core_uri
    registry_docker_image = var.device_docker_image
  }
}

resource "template_file" "user_data" {
  template = file("modules/ecs-cluster/user_data/user-data.sh")

  vars = {
    cluster_name   = var.ecs_cluster_name
  }
}

