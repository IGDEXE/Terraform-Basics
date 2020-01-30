# Segundo Lab
# https://azurecitadel.com/automation/terraform/lab2/

resource "azurerm_resource_group" "lab2" {
  name = "${var.grupoRecursos}"
  location = "${var.localizacao}"
  tags = "${var.tags}"
}

resource "azurerm_storage_account" "lab2sa" {
  name                     = "igd753terraformlab2"
  resource_group_name      = "${azurerm_resource_group.lab2.name}"
  location                 = "${var.localizacao}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}