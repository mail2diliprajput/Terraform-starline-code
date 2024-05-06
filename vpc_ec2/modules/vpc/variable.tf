variable "vpc" {}

variable "cidr" {}

variable "public_subnet" {}

variable "private_subnet" {}

variable "igw" {}

variable "route_table" {}

variable "route_table" {}

variable "availability_zone" {}

variable "create_public_subnet" {
  description = "Set to true if you want to create a public subnet, false for private"
  type        = bool
  default     = false
}