resource "google_compute_instance" "db_proxy" {
  name                      = "${var.resource_prefix}-db-proxy"
  description               = <<-EOT
    A public-facing instance that proxies traffic to the database. This allows
    the db to only have a private IP address, but still be reachable from
    outside the VPC.
  EOT
  machine_type              = var.machine_type
  zone                      = var.zone
  desired_status            = "RUNNING"
  allow_stopping_for_update = true

  # Our firewall looks for this tag when deciding whether to allow SSH traffic
  # to an instance.
  tags = ["ssh-enabled", "allow-db"]

  boot_disk {
    initialize_params {
      image = var.image # latest stable Container-Optimized OS.
      size  = var.size  # smallest disk possible is 10 GB.
      type  = var.type  # use an SSD, not an HDD, because c'mon.
    }
  }

  metadata_startup_script = templatefile("${path.module}/run_cloud_sql_proxy.tpl", {
    "db_instance_name"    = var.db_instance_name,
    "service_account_key" = var.private_key
  })

  network_interface {
    network    = var.network_id
    subnetwork = var.subnetwork_id

    # The access_config block must be set for the instance to have a public IP,
    # even if it's empty.
    access_config {}
  }

  scheduling {
    # Migrate to another physical host during OS updates to avoid downtime.
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}

module "serviceaccount" {
  source           = "../serviceaccount"
  name             = "cloud-sql-proxy"
  role             = "roles/cloudsql.editor"
  gcp_project_name = var.gcp_project_name
}
