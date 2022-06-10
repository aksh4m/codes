variable "rg_name" {}
variable "rg_location" {}
variable "env" {
	default = "dev"
}
variable "team" {
	default = "devops"
}
variable "nsg_name" {}
variable "vnet_name" {}
variable "vnet_cidr" {}
variable "vnet_sub1_name" {}
variable "vnet_sub1_cidr" {}
variable "vnet_nic_name" {}
variable "vm_name" {}
variable "vm_size" {}
variable "vm_osdisk_name" {}
variable "vm_username" {}
variable "vm_pass" {}
variable "vnet_pubip_name" {}
