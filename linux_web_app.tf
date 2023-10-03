locals{
machine_name= ["machine11","machine22","machine33","machine44","machine55"]
}
resource "azurerm_resource_group" "linuxwebapp" {
for_each= azurerm_resource_group.linuxwebapp 
  name     = "mcit-resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "mcit" {
  name                = "mcit"
  resource_group_name = azurerm_resource_group.linuxwebapp.name
  location            = azurerm_resource_group.linuxwebapp.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "mcit" {
  name                = "mcit"
  resource_group_name = azurerm_resource_group.linuxwebapp.name
  location            = azurerm_resource_group.linuxwebapp.location
  service_plan_id     = azurerm_service_plan.mcit.id

  site_config {}
}

