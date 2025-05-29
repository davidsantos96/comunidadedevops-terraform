resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )

}
# Create public subnets for the EKS cluster
resource "aws_route_table" "eks_public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-public-rt"
    }
  )
}
# Create public subnets for the EKS cluster
resource "aws_route_table_association" "eks_rt_association_public_1a" {
  route_table_id = aws_route_table.eks_public_rt.id
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
}

resource "aws_route_table_association" "eks_rt_association_public_1b" {
  route_table_id = aws_route_table.eks_public_rt.id
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
}