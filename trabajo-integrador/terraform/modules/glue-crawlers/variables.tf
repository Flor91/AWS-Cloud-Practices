variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "crawler_name" {
  description = "Crawler Name"
  default     = "aiouti-crawler"
}

variable "crawler_description" {
  description = "Crawler Description"
  default     = "Managed by TerraHub"
}

variable "crawler_role" {
  description = "Crawler Role"
  default     = "arn:aws:iam::622305974757:role/aiouti-glue-role"
}

variable "data_source_path" {
  description = "S3 Source Path"
  default     = "s3://aiouti-lf/lakeformation/measurements/raw"
}

variable "database_name" {
  description = "Database Name"
  default     = "aiouti-db"
}

variable "table_prefix" {
  description = "Table Prefix"
  default     = ""
}

variable "schedule" {
  description = "Schedule, a cron expression in form of cron(15 12 * * ? *) "
  default     = "cron(0/10 * * * ? *)"
}

