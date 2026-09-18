data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}
data "azurerm_location" "current" {
  location = "eastus"
}

resource "azurerm_resource_group" "development" {
  name     = "development-resources"
  location = data.azurerm_location.current.display_name

  tags = {
    Environment  = "development"
    Subscription = data.azurerm_subscription.current.display_name
    CreatedBy    = data.azurerm_client_config.current.object_id
  }
}

resource "azurerm_virtual_network" "development" {
  name                = "development-network"
  resource_group_name = azurerm_resource_group.development.name
  location            = azurerm_resource_group.development.location
  address_space       = [var.vnet_cidr]

  tags = {
    Environment = "development"
    Location    = data.azurerm_location.current.display_name
    CreatedBy   = "${data.azurerm_subscription.current.subscription_id}-${data.azurerm_location.current.display_name}"
  }
}
