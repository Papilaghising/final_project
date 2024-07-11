module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "chatapplication-db"

  engine            = "mysql"
  engine_version    = "8"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "laravel"
  username = "laravel"
  port     = "3306"

  vpc_security_group_ids      = [module.security_group.security_group_id]
  

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the roles
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "chatapplication-RDSMonitoringRole"
  create_monitoring_role = true


  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [module.vpc.private_subnets[0],module.vpc.private_subnets[1]]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "8"

  # Database Deletion Protection
  deletion_protection = true

}