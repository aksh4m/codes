resource "azurerm_virtual_machine" "main" {
  name                = "${local.name}-${var.vm_name}"
  location            = "${azurerm_resource_group.myrg.location}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"
  network_interface_ids = ["${azurerm_network_interface.mynic1.id}"]
  vm_size               = "${var.vm_size}"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }
  
  storage_os_disk {
    name                = "${local.name}-${var.vm_osdisk_name}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${local.name}-${var.vm_name}"
    admin_username = "${var.vm_username}"
    admin_password = "${var.vm_pass}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = "${local.tags}"
}
