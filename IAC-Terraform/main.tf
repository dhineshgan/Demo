# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
  backend "azurerm" {
    storage_account_name = "iacstgaccount2"
    container_name       = "backend-container1"
    key                  = "terraform.tfstate" 
    access_key           = "4ayXaD8dtKCK8Fo5MY6km+7hArbqiSo/DfU91EHfjyAWCKLQbNAqbMUbh/6DaWZXy2NZcb5gDTZ2+AStl1CbvQ=="
  }

}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "rg" {
  name     = "IAC-rg"
  location = var.location-rg
  tags = {
    "Application" = "IacDemo"
  }
}


