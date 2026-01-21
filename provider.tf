terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.10.0, < 1.0.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.28.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}

provider "random" {}

provider "azuredevops" {}
