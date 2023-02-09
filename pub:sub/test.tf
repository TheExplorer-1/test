# main.tf
provider "postgresql" {
  version = "1.14.0"
  alias = "alloydb"
}

resource "postgresql_database" "alloydb" {
  name = var.database_name
  owner = var.role_name
  encoding = "UTF8"
  collate = "en_US.UTF-8"
  ctype = "en_US.UTF-8"
  connection_limit = 100
}

resource "postgresql_role" "alloydb" {
  name = var.role_name
  login = true
  password = var.password
}

output "alloydb_database_name" {
  value = postgresql_database.alloydb.name
}

output "alloydb_role_name" {
  value = postgresql_role.alloydb.name
}

# variables.tf
variable "database_name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "password" {
  type = string
}
