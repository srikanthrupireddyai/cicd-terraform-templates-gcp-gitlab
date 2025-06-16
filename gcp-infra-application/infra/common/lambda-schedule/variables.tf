variable "name" {
  type = string
}

variable "memory" {
  type = number
}

variable "infra_bucket" {
  type = string
}

variable "timeout" {
  type = number
}


variable "object_key" {
  type = string
}

variable "env_list" {
  type = map(string)
  default = {}
}
variable "build_env_list" {
  type    = map(string)
  default = {
    GOOGLE_NODE_RUN_SCRIPTS = ""
  }
}
variable "schedule" {
  type = string
  default = ""
}

variable "service_account" {
  type = string
}

variable "disable_schedule" {
  type = bool
}

variable "entry_point" {
  type = string
}

variable "time_zone" {
  type = string
}

variable "resource_version" {
  default =  ""
}

variable "multiple" {
  type = bool
  default = false
}

variable "trigger_endpoints" {
  type = list(string)
  default = []
}

variable "env" {
  type = string
}

variable "endpoints" {
  type = list(object({
    endpoint = string
    schedule = string
  }))
  default = []
}