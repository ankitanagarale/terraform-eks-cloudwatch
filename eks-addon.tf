# eks_addon.tf
resource "aws_eks_addon" "eks_addons" {
  for_each                  = { for addon in var.addons : addon.name => addon }
  cluster_name              = aws_eks_cluster.eks.name
  addon_name                = each.value.name
  addon_version             = each.value.version
  service_account_role_arn  = aws_iam_role.node.arn
  resolve_conflicts         = "OVERWRITE"

  tags = merge(
    var.tags
  )

  depends_on = [
    aws_eks_node_group.eks-ng
  ]
}

