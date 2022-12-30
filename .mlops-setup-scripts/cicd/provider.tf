terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">= 0.5.8"
    }
  }
  // The `backend` block below configures the gcs backend
  // (docs: https://www.terraform.io/language/settings/backends/gcs)
  // for storing Terraform state in an GCP gcs bucket. The targeted gcs bucket is
  // provisioned by the Terraform config under .mlops-setup-scripts/terraform
  backend "gcs" {
    bucket         = "penrose-cicd-setup-tfstate"
    key            = "cicd-setup.terraform.tfstate"
  }
}

provider "databricks" {
  alias   = "staging"
  profile = var.staging_profile
}

provider "databricks" {
  alias   = "prod"
  profile = var.prod_profile
}

