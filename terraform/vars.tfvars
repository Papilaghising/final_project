# Defines the terraform initalization variables
################################################################################

region                        = "us-east-1"
project                       = "final-project"
terraform                     = true
silo                          = "intern"
owner                         = "papila.ghising"
instance_type                 = "t2.micro"
vpc_security_group_ids        = module.security_group.security_group_id
subnet_id                     = [module.vpc.public_subnets, module.vpc.private_subnets]
monitoring                    = true
associate_public_ip_address   = true
create_iam_instance_profile   = true
# ssm_policy                    = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
name                          = "chatapplication-ec2-server"
ami_id                        = "ami-0e001c9271cf7f3b9"


cidr = "10.0.0.0/16"
azs             = ["us-east-1a", "us-east-1b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]