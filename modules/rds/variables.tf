variable "identifier" {
  description = "A unique identifier for the RDS instance."
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "engine" {
  description = "The database engine to use."
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use."
  type        = string
  default     = "8.0"
}

variable "allocated_storage" {
  description = "The allocated storage size in GB."
  type        = number
}

variable "storage_type" {
  description = "The storage type for the RDS instance."
  type        = string
  default     = "gp3"
}

variable "db_username" {
  description = "The username for the database."
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}

variable "security_groups" {
  type        = list(string)
  description = "A list of security groups to associate with the instances."
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the RDS instance."
  type        = map(string)
  default     = {}
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group to associate with the RDS instance."
  type        = string
  default     = "learn-terraform-db-subnet-group"

}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}
