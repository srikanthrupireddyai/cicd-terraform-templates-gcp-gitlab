resource "google_storage_bucket" "invoice_json_data_bucket" {
  name     = "${local.prefix}${var.resource_version}-invoice-json-data"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "processed_json_bucket" {
  name     = "${local.prefix}${var.resource_version}-processed-json"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "invoice_manual_process_bucket" {
  name     = "${local.prefix}${var.resource_version}-invoice-manual-process"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "invoice_discarded_files_bucket" {
  name     = "${local.prefix}${var.resource_version}-invoice-discarded-files"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "all_invoices_bucket" {
  name     = "${local.prefix}${var.resource_version}-all-invoices"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "sync_crm_data_bucket" {
  name     = "${local.prefix}${var.resource_version}-sync-crm-data"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "cms_input_bucket" {
  name     = "${local.prefix}${var.resource_version}-cms-input"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "pdf_generation_bucket" {
  name     = "${local.prefix}${var.resource_version}-pdf-generation"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "non_pdf_invoices_bucket" {
  name     = "${local.prefix}${var.resource_version}-non-pdf-invoices"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "pdf_invoices_bucket" {
  name     = "${local.prefix}${var.resource_version}-pdf-invoices"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "merchant_configs_bucket" {
  name     = "${local.prefix}${var.resource_version}-merchant-configs"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "document_ai_json_dump_bucket" {
  name     = "${local.prefix}${var.resource_version}-document-ai-json-dump"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "cms_processed_bucket" {
  name     = "${local.prefix}${var.resource_version}-cms-processed"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "cms_output_bucket" {
  name     = "${local.prefix}${var.resource_version}-cms-output"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "statement_ingestion_bucket" {
  name     = "${local.prefix}${var.resource_version}-batch-statement-input"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "configuration_bucket" {
  name     = "${local.prefix}${var.resource_version}-configuration"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "processed_invoices_bucket" {
  name     = "${local.prefix}${var.resource_version}-processed-invoices"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "lbmx_input_bucket" {
  name     = "${local.prefix}${var.resource_version}-lbmx-input"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "attachments_bucket" {
  name     = "${local.prefix}${var.resource_version}-attachments"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "statements_pdf_bucket" {
  name     = "${local.prefix}${var.resource_version}-statements-pdf"
  location = upper(local.gcp_region)
}


resource "google_storage_bucket" "cms_alerts_bucket" {
  name     = "${local.prefix}${var.resource_version}-cms-alerts"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "invoices_ignored_bucket" {
  name     = "${local.prefix}${var.resource_version}-invoices-ignored"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "sample_input_bucket" {
  name     = "${local.prefix}${var.resource_version}-sample-input"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "merchant_image_logo_bucket" {
  name     = "${local.prefix}${var.resource_version}-merchant-image-logo"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "cms_cardholder_bucket" {
  name     = "${local.prefix}${var.resource_version}-cms-cardholder"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "generated_pdfs_fiserv_bucket" {
  name     = "${local.prefix}${var.resource_version}-generated-pdfs-fiserv"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "generated_pdfs_lbmx_bucket" {
  name     = "${local.prefix}${var.resource_version}-generated-pdfs-lbmx"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "generated_pdfs_ats_bucket" {
  name     = "${local.prefix}${var.resource_version}-generated-pdfs-ats"
  location = upper(local.gcp_region)
}


resource "google_storage_bucket" "file_backup_bucket" {
  name     = "sample-${var.env}-file-archive"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "merchant_settlement_bucket" {
  name     = "sample-${var.env}-merchant-settlement"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "individual_statements_pdf_bucket" {
  name     = "sample-${var.env}-individual-statements-pdf"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "generated_pdfs_lbmx_temp_bucket" {
  name     = "sample-${var.env}-generated-pdfs-lbmx-temp"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "gp_sync_data_bucket" {
  name = "sample-${var.env}-gp-sync-data"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "closing_balance_bucket" {
  name = "sample-${var.env}-member-closing-balance"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "recon_gp_data" {
  name = "sample-${var.env}-recon-gp-data"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "recon_gp_data_merchant" {
  name = "sample-${var.env}-recon-gp-data-merchant"
  location = upper(local.gcp_region)
}
resource "google_storage_bucket" "sample_output_bucket" {
  name = "sample-${var.env}-sample-output"
  location = upper((local.gcp_region))
}

resource "google_storage_bucket" "recon_gp_data_processed" {
  name = "sample-${var.env}-recon-gp-data-processed"
  location = upper(local.gcp_region)
}

resource "google_storage_bucket" "marketing_impact" {
  name = "sample-${var.env}-marketing-impact"
  location = upper(local.gcp_region)
}