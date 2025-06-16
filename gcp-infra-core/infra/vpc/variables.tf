// vpc module

variable "name" {
  description = "The name of the VPC to create"
  type        = string
}

variable "env" {
  description = "current environment"
  type        = string
}

variable "resource_prefix" {
  description = "prefix for the resource names"
  type        = string
  default     = "sample"
}

variable "ip_cidr_range" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "min_instances" {
  type = number
}

variable "max_instances" {
  type = number
}

variable "vpc_connector_cidr_range" {
  type = string
}

variable "subnetwork_cidr_range" {
  type = string
}
 