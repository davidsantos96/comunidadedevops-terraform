# iam policy for aws load balancer controller
resource "aws_iam_policy" "eks_controller_policy" {
  name   = "${var.project_name}-eks-controller-policy"
  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}