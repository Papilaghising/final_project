module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.5.0"
  name                        ="chat-application-server"
  instance_type               = var.instance_type
  ami                         = var.ami_id
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [module.security_group.security_group_id]
  availability_zone           = module.vpc.azs[0]
  subnet_id                   = module.vpc.public_subnets[0]
  create_iam_instance_profile = var.create_iam_instance_profile
  # user_data = file("user_data.sh")
  # user_data_replace_on_change = true
  iam_role_description = "SSM Role for accessing EC2 instance"
  iam_role_policies      ={ 
    SSM = data.aws_iam_role.ssm.arn
    ECR = data.aws_iam_role.ecr.arn
  }
}







