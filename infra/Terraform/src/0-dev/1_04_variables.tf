### GENERAL
variable "name" {
  description = "name"
  type        = string
  default     = "celerix"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region used to deploy whole infrastructure"
  type        = string
  default     = "us-east-1"
}


variable "tags" {
  type = map(string)
  default = {
    project-name = "Celerix-accesment"
    app-name     = "Celerix"
  }
}