module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = "ghising-ecr"
  create_lifecycle_policy = false
}