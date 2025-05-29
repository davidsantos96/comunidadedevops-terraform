module "eks_network" {
  source = "./modules/network"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = local.tags
  # Ensure to pass the tags variable if required by the network module

  # Add any other variables required by the network module

}