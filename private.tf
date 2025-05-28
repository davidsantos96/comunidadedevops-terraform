resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 3)
  # Adjust the cidr_block as needed, e.g., "
  availability_zone       = "${data.aws_region.current.id}a"
  tags = merge(
    local.tags,
    # Assuming local.tags is defined in your locals.tf or similar file
    {
      Name = "comunidadedevops-subnet-1a"

      Name                              = "comunidadedevops-priv-subnet-1a",
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
    local.tags,
    # Assuming local.tags is defined in your locals.tf or similar file
    {
      Name = "comunidadedevops-subnet-1b"

      Name                              = "comunidadedevops-priv-subnet-1b",
      "kubernetes.io/role/internal-elb" = "1"
    }

  )
}