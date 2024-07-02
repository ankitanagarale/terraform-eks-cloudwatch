resource "aws_sns_topic" "eks_alerts" {
  name = "eks-alerts"

  tags = merge(
    var.tags
  )
}

resource "aws_sns_topic_subscription" "email_eks_alerts" {
  topic_arn = aws_sns_topic.eks_alerts.arn
  protocol  = "email"
  endpoint  = var.sns-email
}

