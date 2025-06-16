output "invoice_json_data_bucket" {
  value = google_storage_bucket.invoice_json_data_bucket.name
}

output "processed_json_bucket" {
  value = google_storage_bucket.processed_json_bucket.name
}

output "invoice_manual_process_bucket" {
  value = google_storage_bucket.invoice_manual_process_bucket.name
}

output "invoice_discarded_files_bucket" {
  value =  google_storage_bucket.invoice_discarded_files_bucket.name
}

output "all_invoices_bucket" {
  value = google_storage_bucket.all_invoices_bucket.name
}

output "sync_crm_data_bucket" {
  value = google_storage_bucket.sync_crm_data_bucket.name
}

output "cms_input_bucket"{
  value = google_storage_bucket.cms_input_bucket.name
}

output "pdf_generation_bucket"{
  value = google_storage_bucket.pdf_generation_bucket.name
}

output "non_pdf_invoices_bucket"{
  value = google_storage_bucket.non_pdf_invoices_bucket.name
}

output "pdf_invoices_bucket"{
  value = google_storage_bucket.pdf_invoices_bucket.name
}

output "merchant_configs_bucket"{
  value = google_storage_bucket.merchant_configs_bucket.name
}

output "document_ai_json_dump_bucket"{
  value = google_storage_bucket.document_ai_json_dump_bucket.name
}

output "cms_processed_bucket"{
  value = google_storage_bucket.cms_processed_bucket.name
}

output "cms_output_bucket"{
  value = google_storage_bucket.cms_output_bucket.name
}

output "statement_ingestion_bucket"{
  value = google_storage_bucket.statement_ingestion_bucket.name
}

output "configuration_bucket"{
  value = google_storage_bucket.configuration_bucket.name
}

output "processed_invoices_bucket"{
 value = google_storage_bucket.processed_invoices_bucket.name 
}

output "lbmx_input_bucket" {
  value = google_storage_bucket.lbmx_input_bucket.name  
}

output "attachments_bucket" {
  value = google_storage_bucket.attachments_bucket.name
}

output "statements_pdf_bucket" {
  value = google_storage_bucket.statements_pdf_bucket.name
}

output "cms_alerts_bucket" {
  value = google_storage_bucket.cms_alerts_bucket.name
}

output "invoices_ignored_bucket" {
  value = google_storage_bucket.invoices_ignored_bucket.name
}

output "sample_input_bucket" {
  value = google_storage_bucket.sample_input_bucket.name
}

output "merchant_image_logo_bucket" {
  value = google_storage_bucket.merchant_image_logo_bucket.name
}

output "cms_cardholder_bucket"{
  value = google_storage_bucket.cms_cardholder_bucket.name
}

output "generated_pdfs_fiserv_bucket"{
  value = google_storage_bucket.generated_pdfs_fiserv_bucket.name
}

output "generated_pdfs_lbmx_bucket"{
  value = google_storage_bucket.generated_pdfs_lbmx_bucket.name
}

output "generated_pdfs_ats_bucket" {
  value = google_storage_bucket.generated_pdfs_ats_bucket.name
}


output "merchant_settlement_bucket"{
  value = google_storage_bucket.merchant_settlement_bucket.name
}

output "individual_statements_pdf_bucket" {
  value = google_storage_bucket.individual_statements_pdf_bucket.name
}

output "generated_pdfs_lbmx_temp_bucket" {
  value = google_storage_bucket.generated_pdfs_lbmx_temp_bucket.name
}

output "gp_sync_data_bucket" {
  value = google_storage_bucket.gp_sync_data_bucket.name
}

output "closing_balance_bucket" {
  value = google_storage_bucket.closing_balance_bucket.name
}

output "recon_gp_data" {
  value = google_storage_bucket.recon_gp_data.name
}

output "recon_gp_data_merchant" {
  value = google_storage_bucket.recon_gp_data_merchant.name
}

output "sample_output_bucket" {
  value = google_storage_bucket.sample_output_bucket.name
}

output "recon_gp_data_processed" {
  value = google_storage_bucket.recon_gp_data_processed.name
}

output "marketing_impact" {
  value = google_storage_bucket.marketing_impact.name
}

output "file_backup_bucket" {
  value = google_storage_bucket.file_backup_bucket.name
}