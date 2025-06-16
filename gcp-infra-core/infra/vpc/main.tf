// vpc module

resource "google_compute_network" "vpc" {
  name                    = var.name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "regional_subnet" {
  name          = var.name
  region        = local.gcp_region
  project       = local.gcp_project
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnetwork_cidr_range
}

# We need to allocate an IP block for private IPs. We want everything in the VPC
# to have a private IP. This improves security and latency, since requests to
# private IPs are routed through Google's network, not the Internet.
resource "google_compute_global_address" "private_ip_block" {
  name         = "${var.resource_prefix}-${var.env}-private-ip-block"
  description  = "A block of private IP addresses that are accessible only from within the VPC."
  purpose      = "VPC_PEERING"
  address_type = "INTERNAL"
  ip_version   = "IPV4"
  # We don't specify a address range because Google will automatically assign one for us.
  prefix_length = 20 # ~4k IPs
  network       = google_compute_network.vpc.self_link
}

# This enables private services access. This makes it possible for instances
# within the VPC and Google services to communicate exclusively using internal
# IP addresses. Details here:
#   https://cloud.google.com/sql/docs/postgres/configure-private-services-access
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
}

# We'll need this to connect to the Cloud SQL Proxy.
resource "google_compute_firewall" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH traffic to any instance tagged with 'ssh-enabled'"
  network     = google_compute_network.vpc.name
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-enabled"]
}

resource "google_compute_firewall" "allow_db_connection" {
  name        = "allow-db-connection"
  description = "Allow DB Proxy traffic to any instance tagged with 'allow-db'"
  network     = google_compute_network.vpc.name
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-db"]
}

# router to route internet traffic to regional_subnet
resource "google_compute_router" "router" {
  name    = "${var.resource_prefix}-${var.env}-internet-router"
  region  = local.gcp_region
  project = local.gcp_project
  network = google_compute_network.vpc.id
}

# NAT gateway to route egress in regional_subnet
resource "google_compute_router_nat" "serverless_egress_nat" {
  name                               = "${var.resource_prefix}-${var.env}-egress-nat"
  router                             = google_compute_router.router.name
  region                             = local.gcp_region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.regional_subnet.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

# require to create serverless connection
resource "google_vpc_access_connector" "serverless_vpc_connector" {
  provider      = google-beta
  name          = "${var.env}-connector"
  machine_type  = var.machine_type
  min_instances = var.min_instances
  max_instances = var.max_instances
  subnet {
    name = google_compute_subnetwork.regional_subnet.name
  }
  region  = local.gcp_region
  project = local.gcp_project
}
