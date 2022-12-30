terraform {
  // The `backend` block below configures the gcs backend
  // (docs: https://www.terraform.io/language/settings/backends/gcs)
  // for storing Terraform state in an GCP gcs bucket. You can run the setup scripts in mlops-setup-scripts/terraform to
  // provision the gcs bucket referenced below and store appropriate credentials for accessing the bucket from CI/CD.
  backend "gcs" {
    bucket         = "penrose-tfstate"
    key            = "prod.terraform.tfstate"
    location       = "US"
  }
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}
