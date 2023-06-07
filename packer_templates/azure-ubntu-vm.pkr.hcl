variable "arm_client_id" {
  default = "${env("ARM_CLIENT_ID")}"
}
variable "arm_client_secret" {
  default = "${env("ARM_CLIENT_SECRET")}"
}
variable "arm_tenant_id" {
  default = "${env("ARM_TENANT_ID")}"
}
variable "arm_subscription_id" {
  default = "${env("ARM_SUBSCRIPTION_ID")}"
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
  managed_image_name                = "ubuntu-nginx-image-${local.timestamp}"
  os_type                           = "Linux"
  image_publisher                   = "Canonical"
  image_offer                       = "UbuntuServer"
  image_sku                         = "16.04-LTS"
  location                          = "France Central"
  vm_size                           = "Standard_B1s"
}

build {
  sources = ["source.azure-arm.ubuntu"]
  provisioner "shell" {
    inline = [
      "echo Installing Updates",
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get install -y nginx"
    ]
  }
}

