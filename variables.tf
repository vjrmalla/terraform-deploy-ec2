variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "all_cidr_block" {
  description = "all IPs"
  type        = string
  default     = "0.0.0.0/0"
}
variable "ssh_port" {
  description = "An example of a number variable"
  type        = number
  default     = 22
}
variable "instance_name" {
  description = "Instance name"
  type        = string
  default     = "webapp"
}
variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "Key to connect SSH"
  type        = string
  default     = "jenkins"
}
