# This file defines local variables for tagging resources in AWS.
resource "aws_iam_role" "eks_controller_role" {
  name = "${var.project_name}-aws-load-balancer-controller-role"
  # This role is used by the AWS Load Balancer Controller to manage AWS resources.

  assume_role_policy = <<EOF
  
        "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn: aws : iam::${data.aws_caller_identity.current.account_id} 
                : oidc-provider/oidc.eks.${data.aws_region.current.name}. 
                amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE"
            },
            "Action": "sts: AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.${data.aws_region.current.name}. amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE: aud": 
                    "sts. amazonaws. com",
                    "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/EXAMPLED539D4633E53DE1B/1EXAMPLE: sub": 
                    "system: serviceaccount : kube-system: aws-load-balancer-controller"
                }
            }   
        }
    }
 ]

}
EOF

  tags = merge(
    {
      Name = "${var.project_name}-aws-load-balancer-controller-role"
    },
    var.tags
  )
}
# This IAM role is used by the EKS cluster to manage AWS resources.
resource "aws_iam_role_policy_attachment" "eks_controller_role_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn

}