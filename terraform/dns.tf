resource "aws_route53_record" "dns"{
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300

  records = [module.ec2.public_ip]
}