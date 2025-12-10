variable "cluster_name" {
  type = string
}

variable "node_group_desired_capacity" {
  type    = number
  default = 2
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
