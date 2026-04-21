## configuracion de Terraform para el backend de AWS, se pueden añadir otros backends segun se requiera, esto es para almacenar el estado

terraform {
  backend "aws" {
    bucket = "bp-terraform-state"
    key    = "1-test/terraform.tfstate"
    region = var.region
  }
}