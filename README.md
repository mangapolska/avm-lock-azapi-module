# Azure Management Lock Module (AVM)

Terraform module provisions an Azure Management Lock at a Resource Group scope compliant with the Azure Verified Modules (AVM) standard and uses the `azapi` provider.

Fork the module if you would like use it with different `terraform` or/and `azapi` versions.

## Usage

```terraform
module "rg_lock" {
  source = "git::https://github.com/mangapolska/avm-lock-azapi-module"
  subscription_id     = "00000000-0000-0000-0000-000000000000"
  resource_group_name = "existing-resource-group"
  name                = "rg-lock-cannot-delete"
  lock_level          = "CanNotDelete"
  notes               = "This RG is locked to prevent accidental deletion."
}
```

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.12  |
| azapi     | ~> 2.5   |

## Inputs

| Name                  | Description                                                                                                                                | Type         | Default | Required |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------------ | ------- | -------- |
| `name`                | The name of the Management Lock.                                                                                                           | `string`     | n/a     |   yes    |
| `resource_group_name` | The name of the Resource Group where the Management Lock should be created.                                                                | `string`     | n/a     |   yes    |
| `subscription_id`     | The ID of the subscription where the Resource Group resides. Required as the azapi provider does not infer it.                             | `string`     | n/a     |   yes    |
| `lock_level`          | The level of the lock. Possible values are `CanNotDelete` and `ReadOnly`.                                                                  | `string`     | n/a     |   yes    |
| `notes`               | Optional notes to associate with the Management Lock.                                                                                      | `string`     | `null`  |    no    |
| `tags`                | A map of tags. **Note**: Azure Management Locks do not support tags via the ARM API, so this variable is for AVM compliance and is unused. | `map(string)`| `{}`    |    no    |

## Outputs

| Name         | Description                                    |
| ------------ | ---------------------------------------------- |
| `id`         | The fully qualified ID of the Management Lock. |
| `name`       | The name of the Management Lock.               |
| `lock_level` | The level of the Management Lock.              |
