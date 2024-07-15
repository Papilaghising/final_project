module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.5.0"
  name                        = "${var.environment}-chatapp-server"
  instance_type               = var.instance_type
  ami                         = var.ami_id
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [module.security_group.security_group_id]
  availability_zone           = module.vpc.azs[0]
  subnet_id                   = module.vpc.public_subnets[0]
  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_description        = "SSM Role for accessing EC2 instance"

  iam_role_policies = {
    SSM = data.aws_iam_policy.ssm.arn
    ECR = data.aws_iam_policy.ecr.arn
  }
}

resource "aws_eip" "ec2" {
  instance = module.ec2.id
  domain   = "vpc"
}
