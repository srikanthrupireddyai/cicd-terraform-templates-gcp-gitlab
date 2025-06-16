// db module

resource "google_sql_database" "main" {
  name     = "sampledb"
  instance = google_sql_database_instance.main_primary.name
}

resource "google_sql_database_instance" "main_primary" {
  name                = "${var.resource_prefix}-${var.env}-invoice-db"
  deletion_protection = true
  database_version    = var.database_version
  depends_on          = [var.db_depends_on]

  settings {
    tier              = var.instance_type
    availability_type = var.env == "prod" ? "REGIONAL" : "ZONAL" # use "REGIONAL" for prod to distribute data storage across zones
    disk_size         = var.disk_size

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
      start_time                     = "13:00"
      transaction_log_retention_days = "3"

      backup_retention_settings {
        retained_backups = "7"
      }
    }

    ip_configuration {
      ipv4_enabled    = false        # don't give the db a public IPv4
      private_network = var.vpc_link # the VPC where the db will be assigned a private IP
    }
  }
  timeouts {
    create = "30m"
    update = "20m"
  }
}

resource "google_sql_user" "db_user" {
  name     = var.user
  instance = google_sql_database_instance.main_primary.name
  password = var.db_password
}

module "db_url_sercret" {
  source       = "../secrets"
  secret_id    = "secret_sampledb"
  secret_value = "postgresql://${urlencode(google_sql_user.db_user.name)}:${urlencode(google_sql_user.db_user.password)}@${google_sql_database_instance.main_primary.private_ip_address}/${google_sql_database.main.name}"
  secret_label = "database"
}
