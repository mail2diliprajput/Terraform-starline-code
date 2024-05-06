variable "instance_type" {}

variable "private_instance" {}

variable "public_instance" {}

variable "create_public_instance" {
  type    = bool
  default = true
}

variable "create_private_instance" {
  type    = bool
  default = false
}

variable "key_name" {}

