variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  default     = {}
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "instance_storage_type" {
  type        = string
  description = "The storage type for the instance."
  default     = "gp3"
}

variable "instance_storage_size" {
  type        = number
  description = "The size of the instance storage in GB."
  default     = 8
}

variable "instance_count" {
  type        = number
  description = "The number of instances to create."
  default     = 1
}
