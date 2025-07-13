data "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2025-04-01"
  name      = var.resource_group_name
  parent_id = "/subscriptions/${var.subscription_id}"
}

resource "azapi_resource" "lock" {
  name = var.name
  type = "Microsoft.Authorization/locks@2020-05-01"
  parent_id = data.azapi_resource.resource_group.id
  body = {
    properties = {
      level = var.lock_level
      notes = var.notes
    }
  }
}