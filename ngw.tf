# Create NAT Gateways and EIPs for the EKS cluster

resource "aws_eip" "eks_ngw_eip_1a" {

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-eip-1a"
    }
  )

}
# Create NAT Gateways and EIPs for the EKS cluster
resource "aws_eip" "eks_ngw_eip_1b" {

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-eip-1b"
    }
  )

}
# Create NAT Gateways in the public subnets for the EKS cluster
resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )

}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )

}
# Create route tables for the private subnets to route traffic through the NAT Gateways
resource "aws_route_table" "eks_private_rt_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-private-rt-1a"
    }
  )

}

resource "aws_route_table" "eks_private_rt_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-private-rt-1b"
    }
  )
}