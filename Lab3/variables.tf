# Arquivo de variaveis

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