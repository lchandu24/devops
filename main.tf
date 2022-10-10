resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = "West Europe"
}
resource "azurerm_virtual_network" "vnet"{
    name = var.vnet_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = ["10.1.0.0/16"]
}
resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = azurerm_resource_group.rg.name
    address_prefixes = ["10.1.1.0/24"]
}
resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    ip_configuration{
        name =  var.ip_config_name
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}
resource "azurerm_windows_virtual_machine" "winvm" {
    name = var.vm_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    size = "Standard_D2s_v3"
    computer_name = "azurevm"
    admin_username = "chandu"
    admin_password = "Password@1234"
    network_interface_ids = [
        azurerm_network_interface.nic.id,
    ]
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-dataCenter"
        version = "latest"
    }
}