variable "name" {
  type = string
}

variable "memory" {
  type = string
}

variable "infra_bucket" {
  type = string
}

variable "max_delivery_attempts" {
  type = number
  default = 5
}

variable "timeout" {
  type = number
}


variable "object_key" {
  type = string
}

variable "env_list" {
  type = map(string)
  default = {
    GOOGLE_NODE_RUN_SCRIPTS = ""
  }
}

variable "service_account" {
  type = string
}

variable "entry_point" {
  type = string
}

variable "resource_version" {
  default =  ""
}

variable "create_topic" {
  type = bool
  default = true
}

variable "subscribe_to" {
  type = string
  default = ""
}

variable "create_dead_letter" {
  type = bool
  default = true
}

variable "dead_letter_path" {
  type = string
  default = ""
}

variable "env" {
  type = string
}

variable "max_instances" {
  type = number
}

variable "minimum_backoff" {
  type = string
  default = "60s"
}
