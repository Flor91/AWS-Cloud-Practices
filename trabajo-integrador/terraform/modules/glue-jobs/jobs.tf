

resource "aws_s3_bucket_object" "s3_my_glue_job_py" {
  bucket = "aiouti-lf"
  key    =  "lakeformation/measurements/job/aiouti"
  content = template_file.jobs_data.rendered
  etag = md5(template_file.jobs_data.rendered)
}
