# Arquivo de variaveis

variable "grupoRecursos" {
  default = "terraform-lab2"
}

variable "localizacao" {
  default = "West Europe"
}

variable "tags" {
  type = "map" # Define como um "array"
  default = {
      environment = "training"
      source      = "citadel"
  }
}