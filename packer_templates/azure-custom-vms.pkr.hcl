
variable "arm_client_id" {
  default   = "${env("ARM_CLIENT_ID")}"
  sensitive = true
}
variable "arm_client_secret" {
  default   = "${env("ARM_CLIENT_SECRET")}"
  sensitive = true
}
variable "arm_tenant_id" {
  default   = "${env("ARM_TENANT_ID")}"
  sensitive = true

}
variable "arm_subscription_id" {
  default   = "${env("ARM_SUBSCRIPTION_ID")}"
  sensitive = true
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "azure-arm" "ubuntu" {
  client_id       = var.arm_client_id
  client_secret   = var.arm_client_secret
  tenant_id       = var.arm_tenant_id
  subscription_id = var.arm_subscription_id

  managed_image_resource_group_name = "bear"
  managed_image_name                = "mycustom-ubuntu-image-${local.timestamp}"
  os_type                           = "Linux"
  image_publisher                   = "Canonical"
  image_offer                       = "UbuntuServer"
  image_sku                         = "16.04-LTS"
  location                          = "France Central"
  vm_size                           = "Standard_B1s"
  azure_tags = {
    environment = "Stage"
    owner       = "DevopsAdmin"
    os_type     = "Windows"
  }
}


source "azure-arm" "windows" {
  client_id       = var.arm_client_id
  client_secret   = var.arm_client_secret
  tenant_id       = var.arm_tenant_id
  subscription_id = var.arm_subscription_id

  managed_image_resource_group_name = "bear"
  managed_image_name                = "mycustom-windows-image-${local.timestamp}"

  os_type         = "Windows"
  image_publisher = "MicrosoftWindowsServer"
  image_offer     = "WindowsServer"
  image_sku       = "2019-Datacenter"

  communicator   = "winrm"
  winrm_use_ssl  = true
  winrm_insecure = true
  winrm_timeout  = "5m"
  winrm_username = "packer"
  location       = "France Central"
  vm_size        = "Standard_B1s"
  azure_tags = {
    environment = "Stage"
    owner       = "DevopsAdmin"
    os_type     = "Windows"
  }
}

build {
  sources = ["source.azure-arm.ubuntu", "source.azure-arm.windows"]

  provisioner "shell" {
    only = ["source.azure-arm.ubuntu"]
    inline = [
      "echo 'Hello, Packer!'"
    ]
  }
  provisioner "file" {
    except      = ["source.source.azure-arm.windows"]
    destination = "/tmp"
    source      = "../files/"
  }
}








