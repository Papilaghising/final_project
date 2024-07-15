#########ec2 outputs###########
output "ec2_id" {
  description = "The ID of the instance"
  value       = module.ec2.id
}

output "ec2_arn" {
  description = "The ARN of the instance"
  value       = module.ec2.arn
}

output "ec2_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2.instance_state
}

output "ec2_availability_zone" {
  description = "The availability zone of the created instance"
  value       = module.ec2.availability_zone
}

#################################
# vpc outputs
#################################

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.public_subnets
}

########################################
# Database outputs
########################################

output "db_name" {
  description = "Name of the database"
  value       = module.db.db_instance_name
}

output "db_host" {
  description = "endpoint of the database"
  value       = module.db.db_instance_endpoint
}

output "db_username" {
  description = "username of the datatbase"
  value       = module.db.db_instance_username
}


########################################
# ECR outputs
########################################
output "ecr_name" {
  description = "name of the ecr"
  value       = module.ecr.repository_name
}

########################################
# dns outputs
########################################

output "record_name" {
  description = "The name of the Route 53 record"
  value       = aws_route53_record.dns.name
}

output "record_fqdn" {
  description = "The fully qualified domain name of the Route 53 record"
  value       = aws_route53_record.dns.fqdn
}
