variable "service_name" {
  description = "The name of the Cloud Run service to deploy."
  type        = string
}


variable "image_name" {
  description = "gcp image name"
  type        = string
}

variable "max_scale" {
  description = "max scale for the service"
  type = number
}

variable "env_list" {
    type = map(string)
    default = {}
}

variable "secret_key_list" {
  type = map(string)

  default = {}
}

variable "service_account" {
  description = "gcp service account"
  type        = string
}

variable "member" {
  type = string
}

variable "annotations" {
  type = map(string)
}

variable "service_annotations" {
  type = map(string)
}

variable "resource_version" {
  default =  ""
}

variable "container_concurrency" {
  type = number
}

variable "request_timeout" {
  type = number
  default = 300
}

variable "memory" {
  type = string
}

variable "cpu" {
  type = number
}