variable "project_name" {
  description = "The name of the project, used for naming resources."
  type        = string

}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}

}
variable "subnet_private_1a" {
  description = "The ID of the first private subnet in availability zone 1a."
  type        = string

}
variable "subnet_private_1b" {
  description = "The ID of the second private subnet in availability zone 1b."
  type        = string

}
variable "eks_cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}