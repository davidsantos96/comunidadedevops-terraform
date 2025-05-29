# This file defines local variables for tagging resources in AWS.
resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = merge(
    {
      Name = "${var.project_name}-cluster-role"
    },
    var.tags
  )
}
# This IAM role is used by the EKS cluster to manage AWS resources.
resource "aws_iam_role_policy_attachment" "eks_cluster_role_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  
}