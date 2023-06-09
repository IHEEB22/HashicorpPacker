output "packer_image" {
  value = data.azurerm_image.packer_image
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
