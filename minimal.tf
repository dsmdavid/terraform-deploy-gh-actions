terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "0.2.10"
    }
  }
  backend "s3" {
    encrypt        = true
    bucket         = "dvd-bucket-terraform-state"
    dynamodb_table = "dvd-terraform-state-lock"
    region         = "eu-west-1"
  }
}

provider "dbtcloud" {

}