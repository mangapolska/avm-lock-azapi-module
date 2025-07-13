module "rg_lock" {
  source = "git::https://github.com/mangapolska/avm-lock-azapi-module"
  subscription_id     = "00000000-0000-0000-0000-000000000000"
  resource_group_name = "existing-resource-group"
  name                = "rg-lock-cannot-delete"
  lock_level          = "CanNotDelete"
  notes               = "This RG is locked to prevent accidental deletion."
}