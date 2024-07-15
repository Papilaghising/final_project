module "records" {
  source  = "terraform-aws-modules/route53/aws"
  version = "3.1.0"

  zone_name = "sandbox.adex.ltd"

  records = [
    {
      name = "${var.domain_name}"
      type = "A"
      ttl  = 300
      records = [
        "${module.ec2.public_ip}",
      ]
    }
  ]
}
