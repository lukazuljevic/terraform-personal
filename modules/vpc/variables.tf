variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones for the VPC"
  type        = list(string)
}

variable "name_prefix" {
  description = "Name of the VPC"
  type        = string
}


variable "tags" {
  description = "Tags to apply to the VPC"
  type        = map(string)
  default     = {}
}


variable "public_subnets" {
  description = "List of public subnets for the VPC"
  type        = list(string)
  default     = []
}


variable "private_subnets" {
  description = "List of private subnets for the VPC"
  type        = list(string)
  default     = []
}

