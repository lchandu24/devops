variable "rg_name" {
  type        = string
  default     = "demo_rg"
  description = " my resource group "
}
variable "vnet_name" {
  type        = string
  default     = "demo_vnet"
  description = "my virtual network"
}
variable "subnet_name" {
  type        = string
  default     = "frontend"
  description = "my vnet subnet "
}
variable "pip_name" {
  type        = string
  default     = "demo_pip"
  description = " my public ip address "
}
variable "nic_name" {
  type        = string
  default     = "demo_nic"
  description = " my network interface for virtual network "
}
variable "vm_name" {
  type        = string
  default     = "demo_vm"
  description = "my virtual machine"
}
variable "ip_config_name" {
  type        = string
  default     = "demo_ipconfig"
  description = "my internet protocol configuration for nic"
}





