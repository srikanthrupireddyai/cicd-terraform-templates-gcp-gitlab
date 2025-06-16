// db module

output "connection_name" {
  description = "The connection string used by Cloud SQL Proxy, e.g. my-project:us-central1:my-db"
  value       = google_sql_database_instance.main_primary.connection_name
}

output "private_ip" {
  description = "Database private ip address"
  value       = google_sql_database_instance.main_primary.private_ip_address
}

output "public_ip" {
  description = "Database public ip address"
  value       = google_sql_database_instance.main_primary.public_ip_address
}

output "connection_sectret_key" {
  description = "ssm key to the connections"
  value       = module.db_url_sercret.secret_key
}

output "connection_sectret_key_version" {
  description = "ssm key to the connections"
  value       = module.db_url_sercret.secret_key_version
}

output "connection_sectret_key_name" {
  description = "ssm key to the connections"
  value       = module.db_url_sercret.secret_name
}
