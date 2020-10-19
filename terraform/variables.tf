variable "keypair" {
  type = string
}
variable "instance_ami" {
  type = string
}
variable "instance_size" {
  type = string
}
variable "instance_name" {
  type = string
}
variable "instance_tags" {
  type    = list
  default = ["development.terraform", "staging.terraform", "production.terraform"]
}
