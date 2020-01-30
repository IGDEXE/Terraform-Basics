# Primeiro Lab
# https://azurecitadel.com/automation/terraform/lab1/

provider "azurerm" {
  version = "~> 1.33.1" # Define uma versao minima para o Azure RM
}

# Cria um novo grupo de recursos
# Sintaxe: "tipo" "nome"
resource "azurerm_resource_group" "lab1" {
  name     = "terraform-lab1"
  location = "West Europe"
  tags = {
      environment = "training"
  }
}

# Cria uma conta para armazenamento
resource "azurerm_storage_account" "lab1sa" {
  name                     = "igd753terraformlab1"
  resource_group_name      = "${azurerm_resource_group.lab1.name}" # Variavel que referencia o grupo de recursos criado anteriormente
  location                 = "${azurerm_resource_group.lab1.location}" # Nesse caso, pegando a localizacao
  account_tier             = "Standard"
  account_replication_type = "LRS" # Tipo de replicacao, nesse caso Local, mas pode tambem ser global GRS
}