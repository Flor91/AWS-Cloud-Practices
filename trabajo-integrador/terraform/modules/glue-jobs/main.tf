resource "aws_glue_job" "example" {
  name     = var.job_name
  role_arn = var.job_role

  command {
    script_location = "${var.job_script_location}/aiouti"
  }
}

resource "aws_glue_trigger" "example" {
  name     = var.trigger_name
  schedule = "cron(0/10 * * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.example.name
  }
}
