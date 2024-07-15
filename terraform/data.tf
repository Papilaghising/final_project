data "aws_iam_policy" "ssm" {
  name = "AmazonEC2RoleforSSM"
}
data "aws_iam_policy" "ecr" {
  name = "AmazonEC2ContainerRegistryFullAccess"
}