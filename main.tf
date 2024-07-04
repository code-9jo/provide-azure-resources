provider "azurerm" {
    subscription_id = ""
    client_id = ""
    client_secret = ""
    tenant_id = ""
    features {}
}
resource "azurerm_resource_group" "hub-rg" {
    name = "Demo-connectivity-hub-rg"
    location = "Southeast Asia"
    tags = {
      environment = "rattapon"
    }
}
resource "azurerm_resource_group" "identity" {
    name = "Demo-identity-rg"
    location = "Southeast Asia"
    tags = {
      environment = "rattapon"
    }
}
resource "azurerm_resource_group" "management" {
    name = "Demo-management-rg"
    location = "Southeast Asia"
    tags = {
      environment = "rattapon"
    }
}
resource "azurerm_resource_group" "prd" {
    name = "Demo-production-rg"
    location = "Southeast Asia"
    tags = {
      environment = "rattapon"
    }
}
resource "azurerm_resource_group" "dev" {
    name = "Demo-deverlop-rg"
    location = "Southeast Asia"
    tags = {
      environment = "rattapon"
    }
}