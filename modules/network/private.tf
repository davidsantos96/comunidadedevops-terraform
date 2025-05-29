resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 3)
  # Adjust the cidr_block as needed, e.g., "
  availability_zone = "${data.aws_region.current.id}a"
  tags = merge(
    var.tags,
    # Assuming var.tags is defined in your locals.tf or similar file
    {

      Name                              = "${var.project_name}-priv-subnet-1a",
      "kubernetes.io/role/internal-elb" = "1"
    }

  )
}


resource "aws_subnet" "eks_subnet_priavate_1b" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 4)
  # Adjust the cidr_block as needed, e.g., "
  availability_zone = "${data.aws_region.current.id}b"
  # Ensure the availability zone matches your region's AZs

  tags = merge(
    var.tags,
    # Assuming var.tags is defined in your locals.tf or similar file
    {

      Name                              = "${var.project_name}-priv-subnet-1b",
      "kubernetes.io/role/internal-elb" = "1"
    }

  )
}
# Create NAT Gateways in the private subnets for the EKS cluster
resource "aws_route_table_association" "eks_rt_association_private_1a" {
  route_table_id = aws_route_table.eks_private_rt_1a.id
  subnet_id      = aws_subnet.eks_subnet_private_1a.id

}
resource "aws_route_table_association" "eks_rt_association_private_1b" {
  route_table_id = aws_route_table.eks_private_rt_1b.id
  subnet_id      = aws_subnet.eks_subnet_priavate_1b.id

}