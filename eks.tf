# EKS Cluster
resource "aws_eks_cluster" "eks" {
  name     = "${var.project}-cluster"
  role_arn = aws_iam_role.cluster.arn
  version  = var.eks_version

  vpc_config {
    
    subnet_ids              = flatten([aws_subnet.public[*].id, aws_subnet.private[*].id])
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }
   enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
   
  tags = merge(
    var.tags
  )

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy
  ]
}
