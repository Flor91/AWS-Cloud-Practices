resource "aws_iam_role" "s3_access_role" {
  name = "aiouti-s3-role"
  path = var.service_role_path
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "aiouti-bucket-policy",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "s3.amazonaws.com",
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket" "b" {
  bucket = "aiouti-lf"
}

module "events" {
  source = "./lambda"
  lambda_permission_id = var.functions["events"]
  lambda_name = var.functions["events"]
  lambda_path = "modules/lambda/lambda/functions"
  lambda_role = aws_iam_role.s3_access_role.arn
}
