module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "chatapplication-vpc"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

}
