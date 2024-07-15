module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.7.0"

  identifier                  = "${var.environment}-chatapp-db"
  engine                      = "mysql"
  engine_version              = "8.0.37"
  instance_class              = "db.t3.micro"
  allocated_storage           = 5
  db_name                     = "laravel"
  username                    = "laravel"
  port                        = "3306"
  vpc_security_group_ids      = [module.security_group.security_group_id]
  maintenance_window          = "Mon:00:00-Mon:03:00"
  backup_window               = "03:00-06:00"
  monitoring_interval         = "30"
  monitoring_role_name        = "chatapplication-RDSMonitoringRole"
  create_monitoring_role      = true
  create_db_subnet_group      = true
  create_db_option_group      = false
  subnet_ids                  = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  allow_major_version_upgrade = true
  family                      = "mysql8.0"
  major_engine_version        = "8.0"
  deletion_protection         = true
}