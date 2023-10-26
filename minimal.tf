terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "0.2.10"
    }
  }
  backend "s3" {
    encrypt        = true
    dynamodb_table = "dvd-terraform-state-lock"
  }
}

provider "dbtcloud" {

}

resource "dbtcloud_project" "sample_project" {
  name = "dvd_gh_terraform"
}