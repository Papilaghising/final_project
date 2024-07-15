module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "6.1.0"

  name                = "${var.environment}-chatapp-topic"
  create_topic_policy = true
  topic_policy_statements = {
    pub = {
      actions = ["sns:Publish"]
      principals = [{
        type        = "Service"
        identifiers = ["events.amazonaws.com"]
      }]
      effect = "Allow"
    },
    # sub = {
    #   actions = ["sns:Publish"]
    #   principals = [{
    #     type        = "Service"
    #     identifiers = ["cloudwatch.amazonaws.com"]
    #   }]
    #   effect = "Allow"
    # }
  }

  subscriptions = {
    email = {
      protocol = "email"
      endpoint = "papila.ghising@adex.ltd"
    }
  }
}