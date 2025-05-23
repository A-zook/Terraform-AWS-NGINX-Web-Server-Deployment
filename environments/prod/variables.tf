variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "prod"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instance"
  type        = string
}
