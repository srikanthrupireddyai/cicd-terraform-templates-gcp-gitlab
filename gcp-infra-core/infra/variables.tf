variable "db_password" {
  description = "Db passowrd"
  type        = string
}

variable "env" {
  type = string
}

variable "prefix" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "db" {
  type = object({
    env_list : map(string)
    disk_size : number
    instance_type : string
    user : string
    database_version : string
  })
}

variable "dbproxy" {
  type = object({
    env_list : map(string)
    machine_type : string
    image : string
    size : number
    type : string
  })
}

variable "vpc" {
  type = object({
    env_list : map(string)
    machine_type : string
    min_instances : number
    max_instances : number
    ip_cidr_range : string
    vpc_connector_cidr_range : string
    subnetwork_cidr_range : string
  })
}

variable "permissions" {
  type = object({
    prefix : string
  })
}

variable "serviceaccount" {
  type = object({
    name : string
    role : string
  })
}
