provider "azurerm" {
    features {}
    tenant_id = "dfgdfgdfgdddddddd"
    subscription_id = "67776796786786788884dgsdfgdsfg"
}
#Create  Resource Group firewall
resource "azurerm_resource_group" "firewall-rg" {
    name = "Demo-firewall-rg"
    location = "Southeast Asia"
    tags = {
        Environment = "rattapon"
  }
}
#Create  Resource Group App Gateway
resource "azurerm_resource_group" "app-gateway-rg" {
    name ="Demo-app-gateway-rg"
    location = "Southeast Asia"
    tags = {
        Environment = "rattapon"
  }
}
#Create  Resource Virtual WAN
resource "azurerm_resource_group" "vwan" {
    name ="Demo-virtual-wan-rg"
    location = "Southeast Asia"
    tags = {
        Environment = "rattapon"
  }
}
resource "azurerm_resource_group" "Network" {
    name ="Demo-Network-rg"
    location = "Southeast Asia"
    tags = {
        Environment = "rattapon"
  }
}
#Create Virtual Network
resource "azurerm_virtual_network" "vnet1" {
    name = "Demo-hub-vnet"
    resource_group_name = azurerm_resource_group.Network.name
    location = azurerm_resource_group.Network.location
    address_space = ["10.36.0.0/16"]
    dns_servers = ["8.8.8.8","8.8.4.4"]
    tags = {
        Environment = "rattapon"
  }

    subnet{
        name = "firewall-subnet"
        address_prefix = "10.36.0.0/24"
    }

    subnet {
        name = "app-gateway-subnet"
        address_prefix = "10.36.1.0/24"
    }
}
#Create Virtul WAN
resource "azurerm_virtual_wan" "demo-vwan" {
    name = "demo-vwan"
    resource_group_name = azurerm_resource_group.vwan.name
    location = azurerm_resource_group.vwan.location
    tags = {
      Environment = "rattapon"
    }
  
}
#Create Virtul HUB
resource "azurerm_virtual_hub" "hub-vpn" {
    name = "hub-vpn-connection"
    resource_group_name = azurerm_resource_group.vwan.name
    location = azurerm_resource_group.vwan.location
    virtual_wan_id = azurerm_virtual_wan.demo-vwan.id
    address_prefix = "10.36.2.0/24"
    tags = {
      Environment = "rattapon"
    }
  
}
