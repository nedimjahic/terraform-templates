terraform {
  required_version = ">= 1.16.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "template-tfstate-rg"
    storage_account_name = "templatetfstateipa67tks"
    container_name       = "tfstate"
    key                  = "networking.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
