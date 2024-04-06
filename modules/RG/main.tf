resource "azurerm_resource_group" "actionstest" {
  name   = var.rg_name
  location = var.region
  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

# Create DDOS Protection Plan
resource "azurerm_network_ddos_protection_plan" "plan" {
  name                = var.plan_name
  resource_group_name = azurerm_resource_group.actionstest.name
  location            = azurerm_resource_group.actionstest.location
  tags = {
    environment = var.environment
    owner       = var.owner
  }
}


# Create Virtual Network and enabled DDOS protection
resource "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.actionstest.location
  resource_group_name = azurerm_resource_group.actionstest.name

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.plan.id
    enable = true
  }
  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

# Create Subnet within virtual network
resource "azurerm_subnet" "test" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.actionstest.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.0.0/24"]
}
