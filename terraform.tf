provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.53.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}
