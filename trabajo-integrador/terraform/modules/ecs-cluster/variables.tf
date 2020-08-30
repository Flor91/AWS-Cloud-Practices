variable "aws_account_id" {
  default = "622305974757"
  type    = string
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "company" {
  default = "Aiouti"
  type    = string
}

variable "iot_policy" {
  default = "aiouti-thing"
  type    = string
}

variable "availability_zones" {
  type        = list
  description = "The availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ecs_cluster_name" {
  description = "The name of the Amazon ECS cluster."
  default     = "aiouti-cluster"
}

variable "s3_bucket_name" {
  description = "The name of the s3 bucket to store the registry data in."
  default     = "aiouti-lf"
}

variable "device_docker_image" {
  description = "The docker image to use when provisioning the registry."
  default     = "pablojulianperalta/aiouti-device:1.16"
}

/* ECS optimized AMIs per region */
variable "ami" {
  default = "ami-02cfc1ae415add4ce"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "The aws ssh key name."
  default     = "aiouti-key-pair-terraform"
}

variable "key_file" {
  description = "The ssh public key for using with the cloud provider."
  default     = "modules/ecs-cluster/certs/aiouti-key-pair.pem.pub"
}

variable "aiouti_iot_core_uri" {
  description = "Iot core uri for messages"
  default     = "a4pefh4s7d44l-ats.iot.us-east-1.amazonaws.com"
}

