provider "aws" {
  region = "us-east-1" # Update with your desired region
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "testing-terraform-praga"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "300" # 5 minutes
  statistic           = "Average"
  threshold           = "80"  
  alarm_description  = "Alarm when CPU utilization is above 75% for 2 consecutive periods"
  
  dimensions = {
    DBInstanceIdentifier = "ocean-service-prod" # Replace with your actual instance ID
  }

  alarm_actions = ["arn:aws:sns:us-east-1:123456789012:MySNSTopic"] 
  ok_actions    = ["arn:aws:sns:us-east-1:123456789012:MySNSTopic"]
}
