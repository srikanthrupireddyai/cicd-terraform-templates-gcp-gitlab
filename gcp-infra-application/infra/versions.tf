terraform {
  required_version = ">= 1.4.2"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.44.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.65.2"
    }
  }
}