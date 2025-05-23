variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "staging"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instance"
  type        = string
}
