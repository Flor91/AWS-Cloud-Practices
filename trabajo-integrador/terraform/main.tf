
module "ecs-cluster" {
  source = "./modules/ecs-cluster"
}

module "lambda" {
  source = "./modules/lambda"
}

module "glue-crawlers" {
  source = "./modules/glue-crawlers"
}

module "glue-jobs" {
  source = "./modules/glue-jobs"
}

module "glue-crawlers-processed" {
  source = "./modules/glue-crawlers-processed"
}
