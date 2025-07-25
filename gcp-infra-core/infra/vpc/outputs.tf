// vpc module

output "link" {
  description = "A link to the VPC resource, useful for creating resources inside the VPC"
  value       = google_compute_network.vpc.self_link
}

output "subnetwork_link" {
  description = "A link to the VPC resource, useful for creating resources inside the VPC"
  value       = google_compute_subnetwork.regional_subnet.self_link
}

output "name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "private_vpc_connection" {
  description = "The private VPC connection"
  value       = google_service_networking_connection.private_vpc_connection
}
