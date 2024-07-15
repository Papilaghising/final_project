module "status-check-alarm" {
  source              = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  alarm_name          = "${var.environment}-chatappp-status-fail"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Alarm for statuc check"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.sns_topic.topic_arn]
}

module "cpu-alarm" {
  source              = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  alarm_name          = "${var.environment}-chatapp-cpu-alm-frontend"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 10
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"
  alarm_description   = "CPU utilization monitoring alarms for back"
  alarm_actions       = [module.sns_topic.topic_arn]
}
