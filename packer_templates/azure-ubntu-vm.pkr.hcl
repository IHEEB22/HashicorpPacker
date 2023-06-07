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
  
  post-processor "manifest" {
    output = "manifest.json"
    }
  post-processor "checksum" {
    checksum_types = [ "md5", "sha512" ]
    keep_input_artifact = true
  }
}

