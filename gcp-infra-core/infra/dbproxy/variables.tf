// dbproxy module
variable "db_instance_name" {
  description = "The name of the Cloud SQL db, e.g. my-project:us-centra1:my-sql-db"
  type        = string
}


variable "machine_type" {
  description = "The type of VM you want, e.g. f1-micro, c2-standard-4"
  type        = string
}

variable "region" {
  description = "The region that the proxy instance will run in (e.g. us-central1)"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC that the proxy instance will run in"
  type        = string
}

variable "zone" {
  description = "The zone where the VM will be created, e.g. us-centra1-a"
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

variable "gcp_project_name" {
  description = "The name of the GCP project where the db and Cloud SQL Proxy will be created"
  type        = string
}

variable "service_account_email" {
  type = string
}

variable "image" {
  type = string
}

variable "type" {
  type = string
}

variable "size" {
  type = number
}

variable "private_key" {
  type = string
}

variable "network_id" {
  type = string
}

variable "subnetwork_id" {
  type = string
}

