variable "version_id" {
  type = string
}

variable "name" {
  type = string
}

variable "infra_bucket" {
  type = string
}

variable "object_key" {
  type = string
}

variable "env_list" {
  type    = map(string)
  default = {}
}

variable "service_account" {
  description = "gcp service account"
  type        = string
}

variable "max_instances" {
  type = number
}
