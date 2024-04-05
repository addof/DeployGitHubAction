terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.98.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "TestRG"
    storage_account_name = "githubactionsdemo"
    container_name       = "terraformstate"
    key                  = "dev.tfstate"
  }
}


