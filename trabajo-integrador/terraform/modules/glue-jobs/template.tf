resource "template_file" "jobs_data" {
  template = file("modules/glue-jobs/tmp/jobs/aiouti-job.py")
}
