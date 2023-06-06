variable "arm_client_id" {
  default   = "${env("ARM_CLIENT_ID")}"
  sensitive = true

}
variable "arm_client_secret" {
  sensitive = true
}
variable "arm_tenant_id" {
  sensitive = true

}
variable "arm_subscription_id" {
  default   = "${env("ARM_SUBSCRIPTION_ID")}"
  sensitive = true

}
