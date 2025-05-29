module "eks_network" {
  source = "./modules/network"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = local.tags
  # Ensure to pass the tags variable if required by the network module

  # Add any other variables required by the network module

}

module "eks_cluster" {
  source = "./modules/cluster"

  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  # Ensure to pass the tags variable if required by the cluster module

  # Add any other variables required by the cluster module

}