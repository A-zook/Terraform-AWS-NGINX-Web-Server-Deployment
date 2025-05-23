variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
variable "user_data" {}
variable "env" {}
