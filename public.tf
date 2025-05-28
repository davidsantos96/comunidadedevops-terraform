resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 1)
  # Adjust the cidr_block as needed, e.g., "
  availability_zone       = "${data.aws_region.current.id}a"
  map_public_ip_on_launch = true
  tags = {
    Name                     = "comunidadedevops-subnet-1a",
    "kubernetes.io/role/elb" = "1"
  }
}


resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 2)
  # Adjust the cidr_block as needed, e.g., "
  availability_zone = "${data.aws_region.current.id}b"
  # Ensure the availability zone matches your region's AZs
  map_public_ip_on_launch = true

  tags = {
    Name                      = "comunidadedevops-subnet-1b",
    "kubernetes.io/role/elb " = "1"
  }
}