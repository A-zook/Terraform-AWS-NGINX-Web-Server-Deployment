variable "env" {
  default = "dev"
}
variable "ami_id" {}

variable "environment" {
  description = "The name of the environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}
