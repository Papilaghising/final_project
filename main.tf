module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.5.0"
  instance_type               = var.instance_type
  ami                         = var.ami_id
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [module.security_group.security_group_id]
  availability_zone           = module.vpc.azs[0]
  subnet_id                   = module.vpc.public_subnets[0]
  create_iam_instance_profile = var.create_iam_instance_profile
#   user_data = file("user_data.sh")
#   user_data_replace_on_change = true
  iam_role_description = "SSM Role for accessing EC2 instance"
  iam_role_policies      ={ 
    SSM = var.ssm_policy
  }
}



module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "chatapplication-vpc"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "chatappplication-sg"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}


module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "chatapplication-db"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "laravel"
  username = "laravel"
  port     = "3306"

  iam_database_authentication_enabled = true
  vpc_security_group_ids      = [module.security_group.security_group_id]
  

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the roles
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true


  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [module.vpc.private_subnets[0],module.vpc.private_subnets[1]]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = true

}