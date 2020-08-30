#######################################
## main.tf Variables for Glue Crawler ##
#######################################

variable "job_name" {
  description = "Job Name"
  default     = "aiouti-job-lf"
}

variable "trigger_name" {
  description = "Trigger Name"
  default     = "aiouti-trigger-lf"
}

variable "job_description" {
  description = "Job Description"
  default     = "Managed by TerraHub"
}

variable "job_role" {
  description = "Crawler Role"
  default     = "arn:aws:iam::622305974757:role/aiouti-glue-role"
}

variable "data_source_path" {
  description = "S3 Source Path"
  default     = "s3://aiouti-lf/lakeformation/measurements/job"
}


variable "schedule" {
  description = "Schedule, a cron expression in form of cron(0/15 * * * ? *) "
  default     = "cron(0/15 * * * ? *)"
}

variable "job_script_location" {
  description = "Job Script Location"
  default = "s3://aiouti-lf/lakeformation/measurements/job"
}

variable "job_tmp_dir" {
  description = "Job Temporary Directory"
  default = "s3://aiouti-lf/lakeformation/measurements/temporary"
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "aws_account_id" {
  default = "622305974757"
  type    = "string"
}
