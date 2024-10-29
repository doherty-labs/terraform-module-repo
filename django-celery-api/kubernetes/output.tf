output "rabbitmq_password" {
  value = local.rabbitmq_var.password
  sensitive   = true
}

output "rabbitmq_uri" {
  value = local.rabbitmq_uri
  sensitive   = true
}

output "rabbitmq_host" {
  value = local.rabbitmq_var.rabbitmq_host
}

output "rabbitmq_user" {
  value = local.rabbitmq_var.rabbitmq_user
}

output "rabbitmq_vhost" {
  value = local.rabbitmq_var.rabbitmq_vhost
}

output "rabbitmq_port" {
  value = local.rabbitmq_var.rabbitmq_port
}
