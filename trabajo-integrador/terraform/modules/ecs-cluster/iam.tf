/* ecs iam role and policies */
resource "aws_iam_role" "aiouti_ecs_role" {
  name               = "aiouti_ecs_role"
  assume_role_policy = file("modules/ecs-cluster/policies/ecs-role.json")
}

/* ecs service scheduler role */
resource "aws_iam_role_policy" "aiouti_ecs_service_role_policy" {
  name   = "ecs_service_role_policy"
  policy = template_file.ecs_service_role_policy.rendered
  role   = aws_iam_role.aiouti_ecs_role.id
}

/* ec2 container instance role & policy */
resource "aws_iam_role_policy" "aiouti_ecs_instance_role_policy" {
  name   = "ecs_instance_role_policy"
  role   = aws_iam_role.aiouti_ecs_role.id
  policy = file("modules/ecs-cluster/policies/ecs-instance-role-policy.json")
}

/**
 * IAM profile to be used in auto-scaling launch configuration.
 */
resource "aws_iam_instance_profile" "aiouti_ecs" {
  name = "aiouti-ecs-instance-profile"
  path = "/"
  role = aws_iam_role.aiouti_ecs_role.name
}

resource "aws_iam_policy" "aiouti_device_policy" {
  name        = "aiouti-certs-policy"
  path        = "/"
  description = "Provides de test devices access to the certs"

  policy = template_file.ecs_service_role_policy.rendered
}

resource "aws_iam_role_policy_attachment" "ecs_device_certs" {
  role       = aws_iam_role.aiouti_ecs_role.id
  policy_arn = aws_iam_policy.aiouti_device_policy.arn
}

