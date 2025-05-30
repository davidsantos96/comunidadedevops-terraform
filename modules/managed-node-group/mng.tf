#manged node group
resource "aws_eks_node_group" "mng" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.project_name}-mng"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b,
  ]
  # Ensure that aws_subnet.eks_subnet is defined in your network module or elsewhere

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  #instance_types = var.instance_types

  tags = merge(
    {
      Name = "${var.project_name}-mng"
    },
    var.tags
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_policy_attachment,
    aws_iam_role_policy_attachment.eks_mng_cni_policy_attachment,
    aws_iam_role_policy_attachment.eks_mng_policy_attachment,
  ]
}