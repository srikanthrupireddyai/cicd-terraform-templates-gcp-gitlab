// vpc module

variable "env" {
  description = "current environment"
  type        = string
}

variable "resource_prefix" {
  description = "prefix for the resource names"
  type        = string
  default     = "sample"
}
