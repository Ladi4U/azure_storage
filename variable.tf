variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "subscription_id"{
  type=string
}
variable "tenant_id"{
  type=string
}
variable "resource_group_name" {
   description  = "Name of the resource group in which resources will be created"
   type         = string
   default      = "rg"
}
variable "location" {
   type         =  string
   default      = "Canada Central"
   description  = "Location where resources will be created"
}
variable "prefix" {
  type      = string
  default   = "mcit"
}


