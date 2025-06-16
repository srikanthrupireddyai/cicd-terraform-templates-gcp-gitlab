locals {
  env     = var.env
  prefix  = var.prefix
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "gcpapis" {
  source           = "./api"
  gcp_project_name = local.project
}

module "vpc" {
  source                   = "./vpc"
  name                     = "${local.prefix}-${local.env}-vpc"
  env                      = local.env
  resource_prefix          = local.prefix
  ip_cidr_range            = var.vpc["ip_cidr_range"]
  min_instances            = var.vpc["min_instances"]
  max_instances            = var.vpc["max_instances"]
  machine_type             = var.vpc["machine_type"]
  vpc_connector_cidr_range = var.vpc["vpc_connector_cidr_range"]
  subnetwork_cidr_range    = var.vpc["subnetwork_cidr_range"]
  depends_on = [
    module.gcpapis
  ]
}

module "db" {
  source           = "./db"
  disk_size        = var.db["disk_size"]
  instance_type    = var.db["instance_type"]
  db_password      = var.db_password
  user             = var.db["user"]
  env              = local.env
  resource_prefix  = local.prefix
  vpc_name         = module.vpc.name
  vpc_link         = module.vpc.link
  database_version = var.db["database_version"]
  db_depends_on    = module.vpc.private_vpc_connection
  depends_on = [
    module.gcpapis
  ]
}

module "storage" {
  source          = "./storage"
  env             = local.env
  resource_prefix = local.prefix
  depends_on = [
    module.gcpapis
  ]
}

module "permissions" {
  source = "./sa-users"
  prefix = "${var.prefix}_${var.env}"
  depends_on = [
    module.gcpapis
  ]
}

module "dbproxy" {
  source                = "./dbproxy"
  machine_type          = var.dbproxy["machine_type"]
  db_instance_name      = module.db.connection_name
  region                = local.region
  zone                  = local.zone
  vpc_name              = module.vpc.name
  env                   = local.env
  image                 = var.dbproxy["image"]
  size                  = var.dbproxy["size"]
  type                  = var.dbproxy["type"]
  resource_prefix       = local.prefix
  gcp_project_name      = local.project
  service_account_email = var.service_account_email
  private_key           = module.serviceaccount.private_key
  network_id            = module.vpc.link
  subnetwork_id         = module.vpc.subnetwork_link
  depends_on = [
    module.gcpapis,
    module.db
  ]
}

module "serviceaccount" {
  source           = "./serviceaccount"
  name             = var.serviceaccount["name"]
  role             = var.serviceaccount["role"]
  gcp_project_name = local.project
  depends_on = [
    module.gcpapis
  ]
}

