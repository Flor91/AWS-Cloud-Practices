resource "aws_glue_crawler" "example" {
  database_name = var.database_name
  name          = var.crawler_name
  role          = var.crawler_role
  schedule = var.schedule

  s3_target {
    path = "s3://aiouti-lf/lakeformation/measurements/processed"
  }
}
