// Note: AWS region must be specified via environment variable or via the `region` field
// in the provider block below, as described
// in https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables

variable "gcp_project_id" {
  type = string
}

provider "google" {
  project = var.gcp_project_id
}

resource "google_storage_bucket" "terraform_state" {
  name                        = "penrose-tfstate"
  location                    = "US"
  uniform_bucket_level_access = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_storage_bucket" "cicd_terraform_state" {
  name                        = "penrose-cicd-setup-tfstate"
  location                    = "US"
  uniform_bucket_level_access = true
  lifecycle {
    prevent_destroy = true
  }
}
