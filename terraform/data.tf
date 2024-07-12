data "aws_iam_role" "ssm" {
    name = "AmazonEC2RoleforSSM"
}
data "aws_iam_role" "ecr"{
    name = "AmazonEC2ContainerRegistryFullAccess"
}