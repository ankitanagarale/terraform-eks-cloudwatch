resource "aws_cloudwatch_metric_alarm" "eks_apiserver_storage_size_bytes" {
  alarm_name          = "eks-monitoring-storage-bytes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = var.time_periods
  evaluation_periods  = var.evaluate_period
  threshold           = var.threshold_value

  alarm_description = "Detecting high ETCD storage usage when 75%+ is being used in EKS cluster."
  alarm_actions     = [aws_sns_topic.eks_alerts.arn]

  statistic   = "Maximum"
  namespace   = "ContainerInsights"
  metric_name = "apiserver_storage_size_bytes"

  dimensions = {
    ClusterName = aws_eks_cluster.eks.name
  }

  depends_on = [aws_sns_topic.eks_alerts]
}

resource "aws_cloudwatch_metric_alarm" "eks_apiserver_storage_objects" {
  alarm_name          = "eks-monitoring-storage-objects"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = var.time_periods
  evaluation_periods  = var.evaluate_period
  threshold           = var.threshold_value

  alarm_description = "Detecting high ETCD storage objects in EKS cluster."
  alarm_actions     = [aws_sns_topic.eks_alerts.arn]

  statistic   = "Maximum"
  namespace   = "ContainerInsights"
  metric_name = "apiserver_storage_objects"

  dimensions = {
    ClusterName = aws_eks_cluster.eks.name
  }

  depends_on = [aws_sns_topic.eks_alerts]
}

resource "aws_cloudwatch_metric_alarm" "eks_apiserver_request_duration_seconds" {
  alarm_name          = "eks-apiserver-request-duration-seconds"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = var.time_periods
  evaluation_periods  = var.evaluate_period
  threshold           = 1

  alarm_description = "API server request duration exceeds 1 second in EKS cluster."
  alarm_actions     = [aws_sns_topic.eks_alerts.arn]

  statistic   = "Average"
  namespace   = "ContainerInsights"
  metric_name = "apiserver_request_duration_seconds"

  dimensions = {
    ClusterName = aws_eks_cluster.eks.name
  }

  depends_on = [aws_sns_topic.eks_alerts]
}

resource "aws_cloudwatch_metric_alarm" "eks_rest_client_request_duration_seconds" {
  alarm_name          = "eks-rest-client-request-duration-seconds"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = var.time_periods
  evaluation_periods  = var.evaluate_period
  threshold           = 1

  alarm_description = "REST client request duration exceeds 1 second in EKS cluster."
  alarm_actions     = [aws_sns_topic.eks_alerts.arn]

  statistic   = "Average"
  namespace   = "ContainerInsights"
  metric_name = "rest_client_request_duration_seconds"

  dimensions = {
    ClusterName = aws_eks_cluster.eks.name
  }

  depends_on = [aws_sns_topic.eks_alerts]
}

resource "aws_cloudwatch_metric_alarm" "eks_etcd_request_duration_seconds" {
  alarm_name          = "eks-etcd-request-duration-seconds"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = var.time_periods
  evaluation_periods  = var.evaluate_period
  threshold           = 1

  alarm_description = "ETCD request duration exceeds 1 second in EKS cluster."
  alarm_actions     = [aws_sns_topic.eks_alerts.arn]

  statistic   = "Average"
  namespace   = "ContainerInsights"
  metric_name = "etcd_request_duration_seconds"

  dimensions = {
    ClusterName = aws_eks_cluster.eks.name
  }

  depends_on = [aws_sns_topic.eks_alerts]
}

