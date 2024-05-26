##Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "web01" {
  name              = "/${var.general_config["project"]}/${var.general_config["env"]}/web01"
  retention_in_days = 30
}

##Alarm for Log Filter
resource "aws_cloudwatch_log_metric_filter" "error_log_filter" {
  name           = "${var.general_config["project"]}-${var.general_config["env"]}-error-log-filter"
  log_group_name = aws_cloudwatch_log_group.web01.name
  pattern        = var.log_filter_pattern

  metric_transformation {
    name      = "${var.general_config["project"]}-${var.general_config["env"]}-Error-Count"
    namespace = "${var.general_config["project"]}-${var.general_config["env"]}-Error-Count-Namespace"
    value     = var.metric_transformation_value
  }
}

##Cloudwatch Log Detection
resource "aws_cloudwatch_metric_alarm" "cwa_log_detection" {
  alarm_name          = "${var.general_config["project"]}-${var.general_config["env"]}-error-log-detection"
  metric_name         = "${var.general_config["project"]}-${var.general_config["env"]}-Error-Count"
  namespace           = "${var.general_config["project"]}-${var.general_config["env"]}-Error-Count-Namespace"
  statistic           = "Average"
  period              = 300
  threshold           = 1
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  treat_missing_data  = "missing"
  actions_enabled     = var.cwa_actions
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  ok_actions          = [aws_sns_topic.sns_topic.arn]
}