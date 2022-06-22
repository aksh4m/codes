resource "azurerm_network_security_group" "mynsg" {
  name                = "${local.name}-${var.rg_name}"
  location            = "${azurerm_resource_group.myrg.location}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"
  tags = "${local.tags}"
}

resource "azurerm_virtual_network" "myvnet" {
  name                = "${local.name}-${var.vnet_name}"
  location            = "${azurerm_resource_group.myrg.location}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"
  address_space       = ["${var.vnet_cidr}"]
  tags = "${local.tags}"
}

resource "azurerm_subnet" "mysub1" {
  name           = "${local.name}-${var.vnet_sub1_name}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"
  virtual_network_name = "${azurerm_virtual_network.myvnet.name}"
  address_prefixes = ["${var.vnet_sub1_cidr}"]
}

resource "azurerm_public_ip" "mypubip1" {
  name                = "${local.name}-${var.vnet_pubip_name}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"
  location            = "${azurerm_resource_group.myrg.location}"
  allocation_method   = "Dynamic"
  tags = "${local.tags}"
}

resource "azurerm_network_interface" "mynic1" {
  name                = "${local.name}-${var.vnet_nic_name}"
  location            = "${azurerm_resource_group.myrg.location}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"
  tags = "${local.tags}"

  ip_configuration {
    name                          = "${local.name}-${var.vnet_nic_name}"
    subnet_id                     = "${azurerm_subnet.mysub1.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.mypubip1.id}"
  }
}
