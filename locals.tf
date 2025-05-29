# This file defines local variables for tagging resources in AWS.
locals {
  tags = {
    "Department"   = "DevOps"
    "organization" = "Infrastructure and Operations"
    "Environment"  = "Development"
    "Project"      = "EKS"
  }
}