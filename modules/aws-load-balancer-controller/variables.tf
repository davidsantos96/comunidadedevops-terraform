variable "project_name" {
  description = "The name of the project, used for naming resources."
  type        = string

}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}

}