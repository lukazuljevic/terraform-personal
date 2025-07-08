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

variable "subnets" {
  type        = list(string)
  description = "A list of subnets to use for the instances."
  default     = []
}

variable "security_groups" {
  type        = list(string)
  description = "A list of security groups to associate with the instances."
  default     = []
}


variable "name_prefix" {
  type        = string
  description = "A prefix for the names of the resources."
}

variable "public_key" {
  type        = string
  description = "The public key to use for SSH access to the instances."
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOKISXYpYix5E6stynFXekVUpIf6lGJdUvLE5qKmZIlkOAlVQQFbBgM0CwciCO5WnFdACMYQt49YPzjcSUMChxz1b2VqLYbv3NJAPG3tETwixLiviiHaEDJq+SuU/Z/yTNWrmhjYohYjAlFHodQdOSGYqtmi3tc681IbgySEDrzpT3k7YGCk6MsZAX7qE4XWssJgFLEOLJDjOdbgL6CQTmTT1EcrA0Tw1TbfZzsmDcGpZ6RY4NUc+5JMwg7XK6rMvtuR02A+9OAMK3dfl99UO6Y3dRG5mxeQw5sy5WBPqss5rigeDwx//knyHNeyacBQlbNRp4mvHCDI7nKHvKD7OVQWh+MbMZ+yfvpJohTyd6OrjHxLn7zaOZkUTQBY/mhAFN7E3B0y0nUGC4NdJfQY4op05Pu+I2SQwCYMeSEo42gVUgzf8QzTFhOtfRYYXupizMlyN17PpbdMs+8npcCE+423Q0kJdkaLf2JaZIWAtQUpnaJ7oEM/7GqLFhRMB4vqQmTbY2ZPoCqOxGw3Wi9yf4Qpth2G85pHcN6gy6uIQM4BbmTS66nzyF7UqK+Z4o1X4qFhB2L3/EmNs9CCA3ZGqFPz7IlNYaZl1aSFw+IHiH+F9SBDZNyZVa4xv31/IO5vyX+g0d4vJw4A7I8y5ljKCzBofJyrox1cg4Zb5ES/DDnw== luka.zuljo@gmail.com"
}

variable "assign_eip" {
  type    = bool
  default = false
}
