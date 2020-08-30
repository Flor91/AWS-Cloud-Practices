/*resource "aws_quicksight_group" "examplegroup" {
  group_name = "tf-example"
}*/


resource "aws_quicksight_user" "exampleuser" {
  user_name     = "an-admin"
  email         = "leonardomferrari@gmail.com"
  identity_type = "IAM"
  user_role     = "ADMIN"
}
