output "id" {
  description = "The fully qualified ID of the Management Lock."
  value       = azapi_resource.lock.id
}

output "name" {
  description = "The name of the Management Lock."
  value       = azapi_resource.lock.name
}

output "lock_level" {
  description = "The level of the Management Lock."
  value = var.lock_level
}