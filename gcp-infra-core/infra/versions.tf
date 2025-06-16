terraform {
  required_version = "~> 1.3.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.36.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.12.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.36.0"
    }
  }
}
