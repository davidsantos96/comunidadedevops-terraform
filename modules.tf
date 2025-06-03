module "eks_network" {
  source = "./modules/network"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = var.tags
  # Ensure to pass the tags variable if required by the network module

  # Add any other variables required by the network module

}

module "eks_cluster" {
  source = "./modules/cluster"

  project_name     = var.project_name
  tags             = var.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  # Ensure to pass the tags variable if required by the cluster module

  # Add any other variables required by the cluster module

}

module "eks_managed_node_group" {
  source = "./modules/managed-node-group"

  project_name      = var.project_name
  tags              = var.tags
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  eks_cluster_name  = module.eks_cluster.cluster_name
  # Ensure to pass the cluster name variable if required by the manage-node-group module
  # Ensure to pass the tags variable if required by the manage-node-group module

  # Add any other variables required by the manage-node-group module

}

module "eks_load_balancer_controller" {
  source = "./modules/aws-load-balancer-controller"

  project_name = var.project_name
  tags         = var.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
  # Ensure to pass the tags variable if required by the aws-load-balancer-controller module

  # Add any other variables required by the aws-load-balancer-controller module

}