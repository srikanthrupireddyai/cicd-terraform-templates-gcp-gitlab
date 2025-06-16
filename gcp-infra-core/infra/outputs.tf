# output "proxy_ip" {
#   description = <<-EOT
#     The public IP of the instance running Cloud SQL Proxy. psql into this
#     instance to connect to your private db.
#     EOT
#   value       = module.dbproxy.public_ip
# }


output "sample_db_key" {
  value = module.db.connection_sectret_key
}

output "sample_db_private_ip" {
  value = module.db.private_ip
}

output "sample_db_public_ip" {
  value = module.db.public_ip
}

output "sample_db_sectret_name" {
  description = "ssm key name"
  value       = module.db.connection_sectret_key_name
}

output "sample_db_sectret_key_version" {
  description = "ssm key version"
  value       = module.db.connection_sectret_key_version
}
