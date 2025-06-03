# This file defines local variables for tagging resources in AWS.
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "project_name" {
  description = "Project name to be used name the resources (Name tag)"
  type        = string
}
variable "eks_cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "region" {
  description = "AWS region where the resources will be created"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)

}