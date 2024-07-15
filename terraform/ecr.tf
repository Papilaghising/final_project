module "ecr" {
  source = "terraform-aws-modules/ecr/aws"
   version = "2.2.1"
  repository_name         = "${var.environment}-chatapp-ecr"
  create_lifecycle_policy = false
}