terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-sns.git?ref=v2.1.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/sns/aws/2.1.0?tab=inputs
###########################################################
inputs = {
  
}
