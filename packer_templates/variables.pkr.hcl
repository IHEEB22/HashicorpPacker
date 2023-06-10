
# variable "arm_client_id" {
#   default   = "${env("ARM_CLIENT_ID")}"
#   sensitive = true
# }
# variable "arm_client_secret" {
#   default   = "${env("ARM_CLIENT_SECRET")}"
#   sensitive = true
# }
# variable "arm_tenant_id" {
#   default   = "${env("ARM_TENANT_ID")}"
#   sensitive = true

# }
# variable "arm_subscription_id" {
#   default   = "${env("ARM_SUBSCRIPTION_ID")}"
#   sensitive = true
# }

# locals {
#   timestamp = regex_replace(timestamp(), "[- TZ:]", "")
# }