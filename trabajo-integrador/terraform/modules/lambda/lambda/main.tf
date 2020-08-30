variable "lambda_permission_id" {}
variable "lambda_name" {}
variable "lambda_path" {}
variable "lambda_role" {}

resource "aws_lambda_function" "lambda_function" {
  filename         = data.archive_file.lambda_archive.output_path
  publish          = true
  function_name    = var.lambda_name
  role             = var.lambda_role
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.7"
  memory_size      = 256
  timeout          = 60
  source_code_hash = filebase64sha256(data.archive_file.lambda_archive.output_path)
}

resource "aws_lambda_permission" "lambda_permission" {
  depends_on  = [aws_lambda_function.lambda_function]
  statement_id  = var.lambda_permission_id
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "apigateway.amazonaws.com"
}

data "archive_file" "lambda_archive" {
  type = "zip"
  source_file = "${var.lambda_path}/lambda_function.py"
  output_path = "${var.lambda_path}/function.py.zip"
}



output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}
