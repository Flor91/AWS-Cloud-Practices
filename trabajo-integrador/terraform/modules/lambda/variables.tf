variable "aws_account_id" {
  default = "622305974757"
  type    = string
}

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "company" {
  default = "Aiouti"
  type    = string
}

##################################

variable "service_role_path" {
  default = "/service-role/"
  type = string
}

variable "iot_policy" {
  default = "aiouti-thing"
  type = string
}

variable "log_policy" {
  default = "aiouti-log"
  type = string
}

##################################

variable "lambda_basic_execution_role" {
  default = "aiouti-lambda_basic_execution"
  type = string
}

variable "lambda_basic_execution_policy" {
  default = "aiouti-lambda_basic_execution"
  type = string
}

variable "functions" {
  type    = map
  default = {
    "events" = "aiouti-events"
  }
}
