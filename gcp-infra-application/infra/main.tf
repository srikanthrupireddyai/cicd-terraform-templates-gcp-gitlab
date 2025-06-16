# Storage

# file input processor
locals {
  default_env_key = {
    "GOOGLE_NODE_RUN_SCRIPTS": ""
  }
  dynamic_env_list_function_non_pdf_invoice_processor = {
    "DESTINATION_BUCKET_URL" : module.application_storage.invoice_json_data_bucket
    "SOURCE_BUCKET_URL" : module.application_storage.non_pdf_invoices_bucket
    "SOURCE_JSON_BUCKET" : module.application_storage.invoice_json_data_bucket
    "DESTINATION_TEXT_BUCKET": module.application_storage.processed_json_bucket
    "INVOICE_API_URL" : module.service_internal_invoice.url
    "MANUAL_PROCESS_BUCKET_URL" : module.application_storage.invoice_manual_process_bucket
    "DISCARDED_FILES_BUCKET_URL": module.application_storage.invoice_discarded_files_bucket
    "PROCESSED_DESTINATION_BUCKET": module.application_storage.processed_invoices_bucket
    "DESTINATION_CMS_BUCKET": module.application_storage.cms_input_bucket
    "DESTINATION_LBMX_BUCKET": module.application_storage.sample_input_bucket
    "SOURCE_SPILT_PAYMENT_CONFIG_BUCKET_URL": module.application_storage.configuration_bucket
    "DESTINATION_IGNORED_BUCKET": module.application_storage.invoices_ignored_bucket
  }

  dynamic_env_list_function_invoice_preprocessor = {
     "API_URL": module.service_internal_invoice.url
     "DESTINATION_BUCKET_NON_PDF": module.application_storage.non_pdf_invoices_bucket
     "DESTINATION_BUCKET_PDF": module.application_storage.pdf_invoices_bucket
     "SOURCE_BUCKET": module.application_storage.all_invoices_bucket
     "PROCESSED_BUCKET": module.application_storage.processed_invoices_bucket
     "DESTINATION_BUCKET_IGNORED_MERCHANT": module.application_storage.invoices_ignored_bucket
     "DESTINATION_MANUAL_BUCKET": module.application_storage.invoice_manual_process_bucket
  }

  dynamic_env_list_function_sync_crm_data = {
     "API_URL": module.service_internal_invoice.url
  }

   dynamic_env_list_function_ats_balance_loader = {
     "API_URL": module.service_internal_invoice.url,

  }

  dynamic_env_list_function_recon_processor = {
     "API_URL": module.service_internal_invoice.url,
     "RECON_GP_DATA_MERCHNAT":module.application_storage.recon_gp_data_merchant,
    "RECON_GP_DATA_MERCHNAT_PROCESSED":module.application_storage.recon_gp_data_processed
  }

  dynamic_env_list_function_marketing_impact_generator = {
     "API_URL": module.statements_service.url,
     "MARKETING_IMPACT":module.application_storage.marketing_impact,
     "STATEMENT_PDF": module.application_storage.statements_pdf_bucket,
     "ARCHIVE_BUCKET": module.application_storage.file_backup_bucket
  }

    dynamic_env_list_function_cms_atpt_processor = {
     "API_URL": module.statements_service.url,
     "SOURCE_BUCKET":module.application_storage.cms_output_bucket,
     "PROCESSED_BUCKET": module.application_storage.cms_processed_bucket,
  }


  dynamic_env_list_function_recon_invoker = {
     "API_URL": module.service_internal_invoice.url,
     "RECON_PROCESSOR_TOPIC":module.function_recon_processor.topic_path,
     "RECON_GP_DATA_MERCHNAT":module.application_storage.recon_gp_data_merchant,
     "RECON_GP_DATA_PROCESSED":module.application_storage.recon_gp_data_processed

  }
  dynamic_env_list_function_cms_input_file_extractor = {
     "API_URL": module.service_internal_invoice.url
     "BUCKET_NAME": module.application_storage.cms_input_bucket
  }

  dynamic_env_list_function_cms_online_authorisation = {
    "INPUT_BUCKET"    = module.application_storage.cms_output_bucket
    "OUTPUT_BUCKET"   = module.application_storage.cms_processed_bucket
    "INVOICE_API_URL" = module.service_internal_invoice.url
    "CMS_PROXY_URL"   = module.service_cms_proxy.url
  }

  dynamic_env_list_function_lbmx_input_file_extractor = {
     "API_URL": module.service_internal_invoice.url
     "LBMX_BUCKET": module.application_storage.lbmx_input_bucket
     "PROCESSED_BUCKET": module.application_storage.processed_invoices_bucket
  }

  dynamic_env_list_function_pdf_invoice_processor = {  
    "MANUAL_PROCESS_BUCKET" : module.application_storage.invoice_manual_process_bucket
    "CONFIG_BUCKET": module.application_storage.configuration_bucket
    "DOCUMENT_AI_JSON_DUMP_BUCKET": module.application_storage.document_ai_json_dump_bucket
    "NEST_API_URL": module.service_internal_invoice.url
    "NOTIFICATION_TOPIC": module.function_notification_processor.topic_path
    "PROCESSED_BUCKET": module.application_storage.processed_invoices_bucket
    "LBMX_PDF_BUCKET"   = module.application_storage.generated_pdfs_lbmx_bucket
    "INDIVIDUAL_STATMENT_BUCKET": module.application_storage.individual_statements_pdf_bucket
  }

  dynamic_env_list_function_cms_output_file_processor = {
    "API_URL": module.service_internal_invoice.url
    "DESTINATION_BUCKET": module.application_storage.cms_processed_bucket
    "SOURCE_BUCKET": module.application_storage.cms_output_bucket
    "BATCH_AUTH_URL": module.function_cms_batch_authorisation_file.url
    "CARDHOLDER_BUCKET": module.application_storage.cms_cardholder_bucket
    "CMS_ALERT_BUCKET": module.application_storage.cms_alerts_bucket
    "sample_INPUT_BUCKET":module.application_storage.sample_input_bucket
    "o53_REPORT_BUCKET": module.application_storage.merchant_settlement_bucket
    "CARDHOLDER_TOPIC": google_pubsub_topic.cardholder_onboarding_topic.id
    "ATPT_TOPIC":  module.function_cms_atpt_processor.topic_path
  } 

  dynamic_env_list_function_cms_batch_authorisation_file = {
    "API_URL": module.service_internal_invoice.url
    "BUCKET_NAME": module.application_storage.cms_input_bucket 
    "CONFIG_BUCKET_NAME": module.application_storage.configuration_bucket
  }

  dynamic_function_statement_file_input_processor = {
    "STATEMENT_API_URL": "${module.statements_service.url}"
    "STATEMENT_TOPIC": module.function_pdf_statement_generator.topic_path
    "STATEMENT_INGESTION_BUCKET": module.application_storage.statement_ingestion_bucket
    "NOTIFICATION_TOPIC": module.function_notification_processor.topic_path
    "PROCESSED_BUCKET": module.application_storage.cms_processed_bucket
    "RAW_STATEMENT_TOPIC": google_pubsub_topic.raw_statement_topic.id
    "USE_REFACTORED_CODE" : "true"
    "CMS_STATEMENT_TOPIC" : module.function_cms_statement_processor.topic_path
    "INVOICE_COPIER_TOPIC": module.function_invoice_pdf_copier.topic_path
  } 

   dynamic_env_list_function_cms_statement_processor = {
    "STATEMENT_API_URL": "${module.statements_service.url}"
    "STATEMENT_TOPIC": module.function_pdf_statement_generator.topic_path
    "STATEMENT_INGESTION_BUCKET": module.application_storage.statement_ingestion_bucket
    "NOTIFICATION_TOPIC": module.function_notification_processor.topic_path
    "PROCESSED_BUCKET": module.application_storage.cms_processed_bucket
    "RAW_STATEMENT_TOPIC": google_pubsub_topic.raw_statement_topic.id
    "INVOICE_COPIER_TOPIC": module.function_invoice_pdf_copier.topic_path
  }

  dynamic_env_list_service_internal_invoice = {    
    "PROCESSED_INVOICE_BUCKET" : module.application_storage.processed_invoices_bucket
    "PDF_GENERATION_BUCKET" : module.application_storage.pdf_generation_bucket
    "LBMX_PDF_BUCKET": module.application_storage.generated_pdfs_lbmx_bucket
    "FISERV_PDF_BUCKET": module.application_storage.generated_pdfs_fiserv_bucket
    "MANUAL_REVIEW_BUCKET" : module.application_storage.invoice_manual_process_bucket
    "CONFIG_BUCKET": module.application_storage.configuration_bucket
    "ATS_STATEMENT_PROCESSOR_TOPIC": module.function_ats_statement_processor.topic_path
    "CONFIG_SPLIT_PAYMENT_MERCHANTS_PATH": "split-payment-merchants/splitPaymentsMerchants.json"
    "LBMX_TOPIC": module.function_lbmx_input_file_extractor.topic_path
    "PDF_INVOICES_BUCKET": module.application_storage.pdf_invoices_bucket
    "STATEMENT_PDF_BUCKET": module.application_storage.statements_pdf_bucket
  }
  
  dynamic_env_list_statements_service = {    
    "PROCESSED_INVOICE_BUCKET" : module.application_storage.processed_invoices_bucket
    "PDF_GENERATION_BUCKET" : module.application_storage.pdf_generation_bucket
    "LBMX_PDF_BUCKET": module.application_storage.generated_pdfs_lbmx_bucket
    "FISERV_PDF_BUCKET": module.application_storage.generated_pdfs_fiserv_bucket
    "MANUAL_REVIEW_BUCKET" : module.application_storage.invoice_manual_process_bucket
    "CONFIG_BUCKET": module.application_storage.configuration_bucket
    "ATS_STATEMENT_PROCESSOR_TOPIC": module.function_ats_statement_processor.topic_path
    "CONFIG_SPLIT_PAYMENT_MERCHANTS_PATH": "split-payment-merchants/splitPaymentsMerchants.json"
    "LBMX_TOPIC": module.function_lbmx_input_file_extractor.topic_path
    "PDF_INVOICES_BUCKET": module.application_storage.pdf_invoices_bucket
    "STATEMENT_PDF_BUCKET": module.application_storage.statements_pdf_bucket
  }
  dynamic_env_list_file_mover = {
    "CONFIG_BUCKET": module.application_storage.configuration_bucket
    "INTERNAL_INVOICE_URL": module.service_internal_invoice.url
  }

  dynamic_env_list_function_invoice_reporting = {
    "INVOICE_SUMMARY_BUCKET" : module.application_storage.attachments_bucket
    "INTERNAL_INVOICE_URL": module.service_internal_invoice.url
    "NOTIFICATION_TOPIC": module.function_notification_processor.topic_path
    "INVOICE_BUCKET": module.application_storage.processed_invoices_bucket,
    "STATEMENT_GENERATION_TOPIC": module.function_ats_statement_processor.topic_path
    "STATEMENT_MERGER_TOPIC": module.function_pdf_statement_merger.topic_path
    "CMS_STATEMENT_TOPIC": module.function_cms_statement_processor.topic_path
    "CMS_OUTPUT_BUCKET_NAME":module.application_storage.cms_output_bucket
    "CMS_PROCESSED_BUCKET_NAME":module.application_storage.cms_processed_bucket
    "ARCHIVE_BUCKET_NAME":module.application_storage.file_backup_bucket
    "BATCH_AUTH_URL": module.function_cms_batch_authorisation_file.url


  }

  dynamic_env_list_function_cms_alerts_processor = {
    "NOTIFICATION_TOPIC": module.function_notification_processor.topic_path
    "SRC_BUCKET": module.application_storage.cms_alerts_bucket
    "DST_BUCKET": module.application_storage.cms_processed_bucket
  }

    dynamic_env_list_function_cashmanager_extract = {
    "INTERNAL_INVOICE_URL": module.service_internal_invoice.url
    "DST_BUCKET": module.application_storage.sample_input_bucket
    "FEED_LOCATION": module.application_storage.individual_statements_pdf_bucket
  }

  dynamic_env_list_function_myob_transaction = {
    "INTERNAL_INVOICE_URL": module.service_internal_invoice.url
    "DST_BUCKET": module.application_storage.sample_input_bucket
    "FEED_LOCATION": module.application_storage.individual_statements_pdf_bucket
  }
  
  dynamic_env_list_function_invoice_alert_generator = {
    "NOTIFICATION_TOPIC": module.function_notification_processor.topic_path
    "All_INVOICES": module.application_storage.all_invoices_bucket
    "NON_PDF_BUCKET":module.application_storage.non_pdf_invoices_bucket
    "PDF_BUCKET":module.application_storage.pdf_invoices_bucket
    "PROCESSED_BUCKET": module.application_storage.processed_invoices_bucket
    "API_URL": module.service_internal_invoice.url
  }

  dynamic_env_list_function_invoice_pdf_generator = {
    "INVOICE_PDF_GENERATOR_TOPIC": module.function_pdf_statement_generator.topic_path
    "API_URL": module.service_internal_invoice.url
  }

  dynamic_env_list_function_invoice_pdf_copier = {
    "SRC_BUCKET": module.application_storage.generated_pdfs_fiserv_bucket
    "DST_BUCKET": module.application_storage.statements_pdf_bucket
    "INTERNAL_INVOICE_URL": module.statements_service.url
    "ATS_DST_BUCKET": module.application_storage.individual_statements_pdf_bucket
  }

  dynamic_env_list_service_external_client_proxy = {
    "cmsProxyUrl": module.service_cms_proxy.url
    "crmProxyUrl": module.service_crm_proxy.url
    "invoiceApiUrl": module.service_internal_invoice.url
    "PUBSUB_NOTIFICATION_PROCESSOR_TOPIC": module.function_notification_processor.topic_path
    "PUBSUB_APPLICATION_PROCESSOR_TOPIC": module.function_application_processor.topic_path
  }

  dynamic_env_list_function_application_processor = {
    "CMS_PROXY_URL": module.service_cms_proxy.url
    "CRM_PROXY_URL": module.service_crm_proxy.url
  }
  dynamic_env_list_function_cardholder_batch_onboarding = {
    "API_URL": module.service_crm_proxy.url
    "RESPONSE_FILE_BUCKET_NAME": module.application_storage.cms_cardholder_bucket
    "PROCESSED_BUCKET": module.application_storage.cms_processed_bucket
   }

  dynamic_env_list_function_pdf_statement_generator = {
    "DESTINATION_BUCKET": module.application_storage.pdf_generation_bucket
    "LBMX_PDF_BUCKET": module.application_storage.generated_pdfs_lbmx_temp_bucket
    "FISERV_PDF_BUCKET": module.application_storage.generated_pdfs_fiserv_bucket
    "STATEMENTS_BUCKET_NAME": module.application_storage.statements_pdf_bucket
    "sample_INPUT_BUCKET" : module.application_storage.sample_input_bucket
    "API_URL": module.service_internal_invoice.url
    "STATEMENT_API_URL": module.statements_service.url
    "ATS_PDF_BUCKET": module.application_storage.generated_pdfs_ats_bucket
    "INDIVIDUAL_STATEMENTS_BUCKET": module.application_storage.individual_statements_pdf_bucket
   }

  dynamic_env_list_function_apl_settlement_report = {
    "sample_INPUT_BUCKET" : module.application_storage.sample_input_bucket
    "STATEMENT_API_URL": module.service_internal_invoice.url

   }

  dynamic_env_list_function_merchant_settlement = {
    "STATEMENT_TOPIC" : module.function_pdf_statement_generator.topic_path
    "SRC_BUCKET": module.application_storage.merchant_settlement_bucket
    "DST_BUCKET": module.application_storage.sample_input_bucket
    "PROCESSED_BUCKET": module.application_storage.cms_processed_bucket
    "INTERNAL_INVOICE_URL": module.service_internal_invoice.url
  }

  dynamic_env_list_function_xero_transaction = {
    "INTERNAL_INVOICE_URL": module.service_internal_invoice.url
    "DST_BUCKET": module.application_storage.sample_input_bucket
    "FEED_LOCATION": module.application_storage.individual_statements_pdf_bucket
  }

  dynamic_env_list_function_onboarding_data_generator = {
    "DST_BUCKET": module.application_storage.configuration_bucket
    "SRC_BUCKET": module.application_storage.configuration_bucket
  }

  dynamic_env_list_function_pdf_statement_merger = {
    "INTERNAL_INVOICE_URL": module.statements_service.url
    "INPUT_BUCKETS": "${module.application_storage.sample_output_bucket},${module.application_storage.individual_statements_pdf_bucket}"
    "STATEMENT_PDF_BUCKET": "${module.application_storage.statements_pdf_bucket}"
  }

  dynamic_env_list_function_sync_ats_invoice_data = {
    "API_URL" : module.service_internal_invoice.url
    "SOURCE_BUCKET": module.application_storage.gp_sync_data_bucket
  }
  
  dynamic_function_ats_statement_nonmigrated_trigger = {
    "INTERNAL_INVOICE_URL": module.statements_service.url
    "STATEMENT_TOPIC": module.function_ats_statement_processor.topic_path
  }

  dynamic_env_list_function_ats_statement_processor = {
    "INTERNAL_INVOICE_URL": module.statements_service.url
    "STATEMENT_TOPIC": module.function_pdf_statement_generator.topic_path
    "COPIER_TOPIC": module.function_invoice_pdf_copier.topic_path
    "ATS_BUCKET": module.application_storage.generated_pdfs_ats_bucket
    "LBMX_BUCKET": module.application_storage.generated_pdfs_lbmx_bucket
    "LBMX_TEMP_BUCKET": module.application_storage.generated_pdfs_lbmx_temp_bucket
    "INDIVIDUALT_STATEMENTS_PDF": module.application_storage.individual_statements_pdf_bucket
  }

  dynamic_env_list_function_balance_zero_off_processor = {
    "API_URL" : module.service_internal_invoice.url
    "SOURCE_BUCKET": module.application_storage.all_invoices_bucket
  }

}

module "enablers" {
  source = "./common/enablers"
}

module "application_storage" {
  source = "./common/storage"
  resource_version = var.resource_version
  env = var.env
}

# Internal invoice service
module "service_internal_invoice" {
  source           = "./common/cloudrun"
  env_list     =  merge(var.service_internal_invoice["env_list"], local.dynamic_env_list_service_internal_invoice)
  secret_key_list = { "POSTGRES_URL" : local.sample_db_secret_key }
  service_name     = "service-internal-invoice"
  image_name       = "gcr.io/${local.gcp_project}/${var.service_internal_invoice["image_tag"]}:${var.versionConfig["service_internal_invoice"]}"
  max_scale        = var.service_internal_invoice["max_scale"]
  memory           = var.service_internal_invoice["memory"]
  container_concurrency = var.service_internal_invoice["container_concurrency"]
  cpu              = var.service_internal_invoice["cpu"]
  service_account =  var.service_internal_invoice["service_account"]
  request_timeout =  var.service_internal_invoice["request_timeout"]
  member = "serviceAccount:${var.service_internal_invoice["service_account"]}"
  annotations = {
        "client.knative.dev/user-image" = "gcr.io/${local.gcp_project}/${var.service_internal_invoice["image_tag"]}:${var.versionConfig["service_internal_invoice"]}"
        "autoscaling.knative.dev/maxScale"      = "${var.service_internal_invoice["max_scale"]}"
        "autoscaling.knative.dev/minScale"        = "${var.service_internal_invoice["min_scale"]}"
        "run.googleapis.com/vpc-access-connector" = "${var.env}-connector"
        "run.googleapis.com/vpc-access-egress" = "all-traffic"
  }
  service_annotations = {
        "run.googleapis.com/ingress" = "${var.env == "prod" || var.env == "uat" ? "internal" : "all"}"
  }

  resource_version= var.resource_version
  depends_on = [
    module.enablers
  ]
}

resource "google_pubsub_topic" "cardholder_onboarding_topic" {
  name = "pubsub-cardholder-onboarding-topic"
}

resource "google_pubsub_topic" "cardholder_onboarding_dead_letter_topic" {
  name = "pubsub-cardholder-onboarding-topic-dead-letter"
}

resource "google_pubsub_topic" "raw_statement_topic" {
  name = "pubsub-raw-statement-topic"
}

resource "google_pubsub_topic" "raw_statement_dead_letter_topic" {
  name = "pubsub-raw-statement-topic-dead-letter"
}

module "function_xero_transaction" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_xero_transaction["env_list"],
    local.dynamic_env_list_function_xero_transaction,
    local.default_env_key
  )
  service_account    = var.function_xero_transaction["service_account"]
  object_key = "${var.function_xero_transaction["object_key"]}/function_${var.versionConfig["function_xero_transaction"]}.zip"
  name = "xero-transaction"
  memory = var.function_xero_transaction["memory"]
  max_instances = var.function_xero_transaction["max_instances"]
  timeout = var.function_xero_transaction["timeout"]
  entry_point = var.function_xero_transaction["entry_point"]
  resource_version= var.resource_version
  create_topic = false
  create_dead_letter = false
  subscribe_to = google_pubsub_topic.raw_statement_topic.id
  dead_letter_path = google_pubsub_topic.raw_statement_dead_letter_topic.id
  env = var.env
  
  depends_on = [
    module.enablers,
    module.service_internal_invoice
  ]
}

# statement file processor
module "function_statement_file_input_processor" {
  source             = "./common/lambda-schedule-v2"
  infra_bucket       =  var.infra_bucket
  env_list   = merge(
    var.function_statement_file_input_processor["env_list"], 
    local.dynamic_function_statement_file_input_processor,
    local.default_env_key
  )
  service_account    = var.function_statement_file_input_processor["service_account"]
  object_key = "${var.function_statement_file_input_processor["object_key"]}/function_${var.versionConfig["function_statement_file_input_processor"]}.zip"
  name = "statement-file-input-processor"
  memory = var.function_statement_file_input_processor["memory"]
  timeout = var.function_statement_file_input_processor["timeout"]
  entry_point = var.function_statement_file_input_processor["entry_point"]
  schedule = var.function_statement_file_input_processor["schedule"]
  time_zone = var.function_statement_file_input_processor["time_zone"]
  disable_schedule = false
  depends_on = [
    module.enablers,
    google_pubsub_topic.raw_statement_topic,
    google_pubsub_topic.raw_statement_dead_letter_topic
  ]
  resource_version= var.resource_version
  env = var.env
  
}



# notification processor function
module "function_notification_processor" {
  source             = "./common/lambda-pubsub"
  infra_bucket       = var.infra_bucket
  env_list   = var.function_notification_processor["env_list"]
  service_account    = var.function_notification_processor["service_account"]
  object_key = "${var.function_notification_processor["object_key"]}/function_${var.versionConfig["function_notification_processor"]}.zip"
  name = "notification-processor"
  memory = var.function_notification_processor["memory"]
  max_instances = var.function_notification_processor["max_instances"]
  timeout = var.function_notification_processor["timeout"]
  entry_point = var.function_notification_processor["entry_point"]
  depends_on = [
    module.enablers
  ]
  resource_version= var.resource_version
  env = var.env
  
}

#function non pdf parser
module "function_non_pdf_invoice_processor" {
  source             = "./common/lambda-bucket"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_non_pdf_invoice_processor["env_list"], local.dynamic_env_list_function_non_pdf_invoice_processor)
  service_account    = var.function_non_pdf_invoice_processor["service_account"]
  object_key = "${var.function_non_pdf_invoice_processor["object_key"]}/function_${var.versionConfig["function_non_pdf_invoice_processor"]}.zip"
  name = "non-pdf-invoice-processor"
  memory = var.function_non_pdf_invoice_processor["memory"]
  max_instances = var.function_non_pdf_invoice_processor["max_instances"]
  timeout = var.function_non_pdf_invoice_processor["timeout"]
  entry_point = var.function_non_pdf_invoice_processor["entry_point"]
  trigger_bucket_name =  module.application_storage.non_pdf_invoices_bucket
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.application_storage,
    module.service_internal_invoice,
    module.enablers
  ]
  
}

# pdf statement generator function
module "function_pdf_statement_generator" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_pdf_statement_generator["env_list"], 
    local.dynamic_env_list_function_pdf_statement_generator,
    local.default_env_key
  )
  service_account    = var.function_pdf_statement_generator["service_account"]
  object_key = "${var.function_pdf_statement_generator["object_key"]}/function_${var.versionConfig["function_pdf_statement_generator"]}.zip"
  name = "pdf-statement-generator"
  memory = var.function_pdf_statement_generator["memory"]
  max_instances = var.function_pdf_statement_generator["max_instances"]
  timeout = var.function_pdf_statement_generator["timeout"]
  entry_point = var.function_pdf_statement_generator["entry_point"]
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.enablers
  ]
  
}

module "function_myob_transaction" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_myob_transaction["env_list"],
    local.dynamic_env_list_function_myob_transaction,
    local.default_env_key
  )
  service_account    = var.function_myob_transaction["service_account"]
  object_key = "${var.function_myob_transaction["object_key"]}/function_${var.versionConfig["function_myob_transaction"]}.zip"
  name = "myob-transaction"
  memory = var.function_myob_transaction["memory"]
  max_instances = var.function_myob_transaction["max_instances"]
  timeout = var.function_myob_transaction["timeout"]
  entry_point = var.function_myob_transaction["entry_point"]
  resource_version= var.resource_version
  create_topic = false
  create_dead_letter = false
  subscribe_to = google_pubsub_topic.raw_statement_topic.id
  dead_letter_path = google_pubsub_topic.raw_statement_dead_letter_topic.id
  env = var.env
  depends_on = [
    module.enablers,
    module.service_internal_invoice
  ]
}

module "function_balance_zero_off_processor" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list = merge(
    var.function_balance_zero_off_processor["env_list"],
    local.dynamic_env_list_function_balance_zero_off_processor,
    local.default_env_key
  )
  service_account     = var.function_balance_zero_off_processor["service_account"]
  object_key          = "${var.function_balance_zero_off_processor["object_key"]}/function_${var.versionConfig["function_balance_zero_off_processor"]}.zip"
  name                = "balance-zero-off-processor"
  memory              = var.function_balance_zero_off_processor["memory"]
  max_instances       = var.function_balance_zero_off_processor["max_instances"]
  timeout             = var.function_balance_zero_off_processor["timeout"]
  entry_point         = var.function_balance_zero_off_processor["entry_point"]
  resource_version    = var.resource_version
  env                 = var.env
  depends_on = [
    module.enablers,
    module.service_internal_invoice
  ]
}

# apl settlement report function
module "function_apl_settlement_report" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_apl_settlement_report["env_list"], 
    local.dynamic_env_list_function_apl_settlement_report,
    local.default_env_key
  )
  service_account    = var.function_apl_settlement_report["service_account"]
  object_key = "${var.function_apl_settlement_report["object_key"]}/function_${var.versionConfig["function_apl_settlement_report"]}.zip"
  name = "apl-settlement-report"
  memory = var.function_apl_settlement_report["memory"]
  max_instances = var.function_apl_settlement_report["max_instances"]
  timeout = var.function_apl_settlement_report["timeout"]
  subscribe_to = module.function_pdf_statement_generator.topic_path
  create_topic = false
  entry_point = var.function_apl_settlement_report["entry_point"]
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.enablers
  ]
  
}

module "function_cashmanager_extract" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_cashmanager_extract["env_list"],
    local.dynamic_env_list_function_cashmanager_extract,
    local.default_env_key
  )
  service_account    = var.function_cashmanager_extract["service_account"]
  object_key = "${var.function_cashmanager_extract["object_key"]}/function_${var.versionConfig["function_cashmanager_extract"]}.zip"
  name = "cashmanager-extract"
  memory = var.function_cashmanager_extract["memory"]
  max_instances = var.function_cashmanager_extract["max_instances"]
  timeout = var.function_cashmanager_extract["timeout"]
  entry_point = var.function_cashmanager_extract["entry_point"]
  resource_version= var.resource_version
  create_topic = false
  create_dead_letter = false
  subscribe_to = google_pubsub_topic.raw_statement_topic.id
  dead_letter_path = google_pubsub_topic.raw_statement_dead_letter_topic.id
  env = var.env
  depends_on = [
    module.enablers,
    module.service_internal_invoice
  ]
}


# function_invoice_preprocessor
module "function_invoice_preprocessor" {
  source             = "./common/lambda-bucket-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_invoice_preprocessor["env_list"], 
    local.dynamic_env_list_function_invoice_preprocessor,
    local.default_env_key
  )
  service_account    = var.function_invoice_preprocessor["service_account"]
  object_key = "${var.function_invoice_preprocessor["object_key"]}/function_${var.versionConfig["function_invoice_preprocessor"]}.zip"
  name = "invoice-preprocessor"
  memory = var.function_invoice_preprocessor["memory"]
  max_instances = var.function_invoice_preprocessor["max_instances"]
  timeout = var.function_invoice_preprocessor["timeout"]
  entry_point = var.function_invoice_preprocessor["entry_point"]
  trigger_bucket_name = module.application_storage.all_invoices_bucket
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}

# function-cms-input-file-extractor
module "function_cms_input_file_extractor" {
  source             = "./common/lambda-schedule"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_cms_input_file_extractor["env_list"], local.dynamic_env_list_function_cms_input_file_extractor)
  service_account    = var.function_cms_input_file_extractor["service_account"]
  object_key = "${var.function_cms_input_file_extractor["object_key"]}/function_${var.versionConfig["function_cms_input_file_extractor"]}.zip"
  name = "cms-input-file-extractor"
  memory = var.function_cms_input_file_extractor["memory"]
  timeout = var.function_cms_input_file_extractor["timeout"]
  entry_point = var.function_cms_input_file_extractor["entry_point"]
  schedule = var.function_cms_input_file_extractor["schedule"]
  time_zone = var.function_cms_input_file_extractor["time_zone"]
  disable_schedule = false
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}


# function-cms-online-authorisation
module "function_cms_online_authorisation" {
  source           = "./common/lambda-schedule"
  infra_bucket     = var.infra_bucket
  env_list         = merge(var.function_cms_online_authorisation["env_list"], local.dynamic_env_list_function_cms_online_authorisation)
  service_account  = var.function_cms_online_authorisation["service_account"]
  object_key       = "${var.function_cms_online_authorisation["object_key"]}/function_${var.versionConfig["function_cms_online_authorisation"]}.zip"
  name             = "cms-online-authorisation"
  memory           = var.function_cms_online_authorisation["memory"]
  timeout          = var.function_cms_online_authorisation["timeout"]
  entry_point      = var.function_cms_online_authorisation["entry_point"]
  schedule         = var.function_cms_online_authorisation["schedule"]
  time_zone        = var.function_cms_online_authorisation["time_zone"]
  disable_schedule = false
  resource_version = var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}
# function-lbmx-input-file-extractor
module "function_lbmx_input_file_extractor" {
  source             = "./common/lambda-pubsub"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_lbmx_input_file_extractor["env_list"], local.dynamic_env_list_function_lbmx_input_file_extractor)
  service_account    = var.function_lbmx_input_file_extractor["service_account"]
  object_key = "${var.function_lbmx_input_file_extractor["object_key"]}/function_${var.versionConfig["function_lbmx_input_file_extractor"]}.zip"
  name = "lbmx-input-file-extractor"
  memory = var.function_lbmx_input_file_extractor["memory"]
  max_instances = var.function_lbmx_input_file_extractor["max_instances"]
  timeout = var.function_lbmx_input_file_extractor["timeout"]
  entry_point = var.function_lbmx_input_file_extractor["entry_point"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}


# function-sync-crm-data
module "function_sync_crm_data" {
  source             = "./common/lambda-bucket"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_sync_crm_data["env_list"], local.dynamic_env_list_function_sync_crm_data)
  service_account    = var.function_sync_crm_data["service_account"]
  object_key = "${var.function_sync_crm_data["object_key"]}/function_${var.versionConfig["function_sync_crm_data"]}.zip"
  name = "sync-crm-data"
  memory = var.function_sync_crm_data["memory"]
  max_instances = var.function_sync_crm_data["max_instances"]
  timeout = var.function_sync_crm_data["timeout"]
  entry_point = var.function_sync_crm_data["entry_point"]
  trigger_bucket_name = module.application_storage.sync_crm_data_bucket
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}

# file mover function
module "function_file_mover" {
  source             = "./common/lambda-schedule-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_file_mover["env_list"], 
    local.dynamic_env_list_file_mover,
    local.default_env_key
  )
  service_account    = var.function_file_mover["service_account"]
  object_key = "${var.function_file_mover["object_key"]}/function_${var.versionConfig["function_file_mover"]}.zip"
  name = "file-mover"
  memory = var.function_file_mover["memory"]
  timeout = var.function_file_mover["timeout"]
  entry_point = var.function_file_mover["entry_point"]
  schedule = var.function_file_mover["schedule"]
  time_zone = var.function_file_mover["time_zone"]
  disable_schedule = false
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}

# function-pdf-invoice-processor
module "function_pdf_invoice_processor" {
  source             = "./common/lambda-bucket"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_pdf_invoice_processor["env_list"], local.dynamic_env_list_function_pdf_invoice_processor)
  service_account    = var.function_pdf_invoice_processor["service_account"]
  object_key = "${var.function_pdf_invoice_processor["object_key"]}/function_${var.versionConfig["function_pdf_invoice_processor"]}.zip"
  name = "pdf-invoice-processor"
  memory = var.function_pdf_invoice_processor["memory"]
  max_instances = var.function_pdf_invoice_processor["max_instances"]
  timeout = var.function_pdf_invoice_processor["timeout"]
  entry_point = var.function_pdf_invoice_processor["entry_point"]
  trigger_bucket_name = module.application_storage.pdf_invoices_bucket
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}


# service-crm-proxy
 module "service_crm_proxy" {
  source           = "./common/cloudrun"
  env_list     =  var.service_crm_proxy["env_list"]
  secret_key_list = { "authConfig" : var.service_crm_proxy["auth_config_key"] }
  service_name     = "service-crm-proxy"
  image_name       = "gcr.io/${local.gcp_project}/${var.service_crm_proxy["image_tag"]}:${var.versionConfig["service_crm_proxy"]}"
  max_scale        = var.service_crm_proxy["max_scale"]
  memory           = var.service_crm_proxy["memory"]
  container_concurrency = var.service_crm_proxy["container_concurrency"]
  cpu              = var.service_crm_proxy["cpu"]
  service_account = var.service_crm_proxy["service_account"]
  request_timeout =  var.service_crm_proxy["request_timeout"]
  annotations = {
         "client.knative.dev/user-image" = "gcr.io/${local.gcp_project}/${var.service_crm_proxy["image_tag"]}:${var.versionConfig["service_crm_proxy"]}"
         "autoscaling.knative.dev/maxScale"      = "${var.service_crm_proxy["max_scale"]}"
  }
  service_annotations = {
         "run.googleapis.com/ingress" = "${var.env == "prod" || var.env == "uat" ? "internal" : "all"}"
  }

  member = "serviceAccount:${var.service_internal_invoice["service_account"]}"
  resource_version= var.resource_version
  depends_on = [
    module.enablers
  ]
}

# service-external-client-proxy
module "service_external_client_proxy" {
  source           = "./common/cloudrun"
  env_list     =  merge(var.service_external_client_proxy["env_list"], local.dynamic_env_list_service_external_client_proxy)
  secret_key_list = { 
    "authConfig" : var.service_external_client_proxy["auth_config_key"], 
    "externalClientHttpConfig" : var.service_external_client_proxy["external_client_http_config_key"],
    "POSTGRES_URL" : local.sample_db_secret_key
  }
  service_name     = "service-external-client-proxy"
  image_name       = "gcr.io/${local.gcp_project}/${var.service_external_client_proxy["image_tag"]}:${var.versionConfig["service_external_client_proxy"]}"
  max_scale        = var.service_external_client_proxy["max_scale"]
  memory           = var.service_external_client_proxy["memory"]
  container_concurrency = var.service_external_client_proxy["container_concurrency"]
  cpu              = var.service_external_client_proxy["cpu"]
  request_timeout =  var.service_external_client_proxy["request_timeout"]
  service_account = var.service_external_client_proxy["service_account"]
  resource_version= var.resource_version
  annotations = {
         "client.knative.dev/user-image" = "gcr.io/${local.gcp_project}/${var.service_external_client_proxy["image_tag"]}:${var.versionConfig["service_external_client_proxy"]}"
         "autoscaling.knative.dev/maxScale"      = "${var.service_external_client_proxy["max_scale"]}"
         "run.googleapis.com/vpc-access-connector" = "${var.env}-connector"
         "run.googleapis.com/vpc-access-egress" = "all-traffic"
  }
  service_annotations = {
         "run.googleapis.com/ingress" = "${var.env == "prod" || var.env == "uat" ? "internal-and-cloud-load-balancing" : "all"}"
  }
 
   member = "allUsers"
   depends_on = [
     module.enablers
   ]
 }

# service_cms_proxy
 module "service_cms_proxy" {
   source           = "./common/cloudrun"
   env_list     =  var.service_cms_proxy["env_list"]
   secret_key_list = { "authConfig" : var.service_cms_proxy["auth_config_key"] }
   service_name     = "service-cms-proxy"
   image_name       = "gcr.io/${local.gcp_project}/${var.service_cms_proxy["image_tag"]}:${var.versionConfig["service_cms_proxy"]}"
   max_scale        = var.service_cms_proxy["max_scale"]
   memory           = var.service_cms_proxy["memory"]
   container_concurrency = var.service_cms_proxy["container_concurrency"]
   cpu              = var.service_cms_proxy["cpu"]
   request_timeout =  var.service_cms_proxy["request_timeout"]
   service_account = var.service_cms_proxy["service_account"]
   annotations = {
         "client.knative.dev/user-image" = "gcr.io/${local.gcp_project}/${var.service_cms_proxy["image_tag"]}:${var.versionConfig["service_cms_proxy"]}"
         "autoscaling.knative.dev/maxScale"      = "${var.service_cms_proxy["max_scale"]}"
   }
   service_annotations = {
         "run.googleapis.com/ingress" = "${var.env == "prod" || var.env == "uat" ? "internal" : "all"}"
   }

   member = "serviceAccount:${var.service_internal_invoice["service_account"]}"
   resource_version= var.resource_version
   depends_on = [
     module.enablers
   ]
 }

 # function-cms-output-file-processor
module "function_cms_output_file_processor" {
  source             = "./common/lambda-bucket"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_cms_output_file_processor["env_list"], local.dynamic_env_list_function_cms_output_file_processor)
  service_account    = var.function_cms_output_file_processor["service_account"]
  object_key = "${var.function_cms_output_file_processor["object_key"]}/function_${var.versionConfig["function_cms_output_file_processor"]}.zip"
  name = "cms-output-file-processor"
  memory = var.function_cms_output_file_processor["memory"]
  max_instances = var.function_cms_output_file_processor["max_instances"]
  timeout = var.function_cms_output_file_processor["timeout"]
  entry_point = var.function_cms_output_file_processor["entry_point"]
  trigger_bucket_name = module.application_storage.cms_output_bucket
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}

 
# function-cms-batch-authorisation-file
module "function_cms_batch_authorisation_file" {
  source             = "./common/lambda-http"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_cms_batch_authorisation_file["env_list"], local.dynamic_env_list_function_cms_batch_authorisation_file)
  service_account    = var.function_cms_batch_authorisation_file["service_account"]
  object_key = "${var.function_cms_batch_authorisation_file["object_key"]}/function_${var.versionConfig["function_cms_batch_authorisation_file"]}.zip"
  name = "cms-batch-authorisation-file"
  memory = var.function_cms_batch_authorisation_file["memory"]
  max_instances = var.function_cms_batch_authorisation_file["max_instances"]
  timeout = var.function_cms_batch_authorisation_file["timeout"]
  entry_point = var.function_cms_batch_authorisation_file["entry_point"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

# function-invoice-reporting
module "function_invoice_reporting" {
  source             = "./common/lambda-schedule"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_invoice_reporting["env_list"], local.dynamic_env_list_function_invoice_reporting)
  service_account    = var.function_invoice_reporting["service_account"]
  object_key = "${var.function_invoice_reporting["object_key"]}/function_${var.versionConfig["function_invoice_reporting"]}.zip"
  name = "invoice-reporting"
  memory = var.function_invoice_reporting["memory"]
  timeout = var.function_invoice_reporting["timeout"]
  entry_point = var.function_invoice_reporting["entry_point"]
  time_zone = var.function_invoice_reporting["time_zone"]
  disable_schedule = false
  multiple = true
  endpoints = var.function_invoice_reporting["endpoints"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

#function-cms-alerts-processor
module "function_cms_alerts_processor" {
  source             = "./common/lambda-bucket-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_cms_alerts_processor["env_list"], 
    local.dynamic_env_list_function_cms_alerts_processor,
    local.default_env_key
  )
  service_account    = var.function_cms_alerts_processor["service_account"]
  object_key = "${var.function_cms_alerts_processor["object_key"]}/function_${var.versionConfig["function_cms_alerts_processor"]}.zip"
  name = "cms-alerts-processor"
  memory = var.function_cms_alerts_processor["memory"]
  max_instances = var.function_cms_alerts_processor["max_instances"]
  timeout = var.function_cms_alerts_processor["timeout"]
  entry_point = var.function_cms_alerts_processor["entry_point"]
  trigger_bucket_name = module.application_storage.cms_alerts_bucket
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

#function-invoice-pdf-copier
module "function_invoice_pdf_copier" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_invoice_pdf_copier["env_list"], local.dynamic_env_list_function_invoice_pdf_copier)
  service_account    = var.function_invoice_pdf_copier["service_account"]
  object_key = "${var.function_invoice_pdf_copier["object_key"]}/function_${var.versionConfig["function_invoice_pdf_copier"]}.zip"
  name = "invoice-pdf-copier"
  memory = var.function_invoice_pdf_copier["memory"]
  max_instances = var.function_invoice_pdf_copier["max_instances"]
  timeout = var.function_invoice_pdf_copier["timeout"]
  create_topic = true
  create_dead_letter = true
  entry_point = var.function_invoice_pdf_copier["entry_point"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

#function-application-processor
module "function_application_processor" {
  source             = "./common/lambda-pubsub"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_application_processor["env_list"],local.dynamic_env_list_function_application_processor)
  service_account    = var.function_application_processor["service_account"]
  object_key = "${var.function_application_processor["object_key"]}/function_${var.versionConfig["function_application_processor"]}.zip"
  name = "application-processor"
  memory = var.function_application_processor["memory"]
  max_instances = var.function_application_processor["max_instances"]
  timeout = var.function_application_processor["timeout"]
  entry_point = var.function_application_processor["entry_point"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}

# function-cardholder-batch-onboarding
module "function_cardholder_batch_onboarding" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_cardholder_batch_onboarding["env_list"], 
    local.dynamic_env_list_function_cardholder_batch_onboarding,
    local.default_env_key
  )
  service_account    = var.function_cardholder_batch_onboarding["service_account"]
  object_key = "${var.function_cardholder_batch_onboarding["object_key"]}/function_${var.versionConfig["function_cardholder_batch_onboarding"]}.zip"
  name = "cardholder-batch-onboarding"
  memory = var.function_cardholder_batch_onboarding["memory"]
  max_instances = var.function_cardholder_batch_onboarding["max_instances"]
  timeout = var.function_cardholder_batch_onboarding["timeout"]
  entry_point = var.function_cardholder_batch_onboarding["entry_point"]
  resource_version= var.resource_version
  create_topic = false
  create_dead_letter = false
  subscribe_to = google_pubsub_topic.cardholder_onboarding_topic.id
  dead_letter_path = google_pubsub_topic.cardholder_onboarding_dead_letter_topic.id
  env = var.env

  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

#function-invoice-alert-generator
module "function_invoice_alert_generator" {
  source             = "./common/lambda-schedule"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_invoice_alert_generator["env_list"], local.dynamic_env_list_function_invoice_alert_generator)
  service_account    = var.function_invoice_alert_generator["service_account"]
  object_key = "${var.function_invoice_alert_generator["object_key"]}/function_${var.versionConfig["function_invoice_alert_generator"]}.zip"
  name = "invoice-alert-generator"
  memory = var.function_invoice_alert_generator["memory"]
  timeout = var.function_invoice_alert_generator["timeout"]
  entry_point = var.function_invoice_alert_generator["entry_point"]
  schedule = var.function_invoice_alert_generator["schedule"]
  time_zone = var.function_invoice_alert_generator["time_zone"]
  disable_schedule = false
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage,
    module.service_internal_invoice
  ]
}

module "function_merchant_settlement" {
  source             = "./common/lambda-bucket"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_merchant_settlement["env_list"], local.dynamic_env_list_function_merchant_settlement)
  service_account    = var.function_merchant_settlement["service_account"]
  object_key = "${var.function_merchant_settlement["object_key"]}/function_${var.versionConfig["function_merchant_settlement"]}.zip"
  name = "function-merchant-settlement"
  memory = var.function_merchant_settlement["memory"]
  max_instances = var.function_merchant_settlement["max_instances"]
  timeout = var.function_merchant_settlement["timeout"]
  entry_point = var.function_merchant_settlement["entry_point"]
  trigger_bucket_name = module.application_storage.merchant_settlement_bucket
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers
  ]
}

module "function_onboarding_data_generator" {
  source             = "./common/lambda-http-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_onboarding_data_generator["env_list"], 
    local.dynamic_env_list_function_onboarding_data_generator,
    local.default_env_key
  )
  service_account    = var.function_onboarding_data_generator["service_account"]
  object_key = "${var.function_onboarding_data_generator["object_key"]}/function_${var.versionConfig["function_onboarding_data_generator"]}.zip"
  name = "onboarding-data-generator"
  memory = var.function_onboarding_data_generator["memory"]
  max_instances = var.function_onboarding_data_generator["max_instances"]
  timeout = var.function_onboarding_data_generator["timeout"]
  entry_point = var.function_onboarding_data_generator["entry_point"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.application_storage,
    module.enablers
  ]
}

### function_pdf_statement_merger ###
module "function_pdf_statement_merger" {
  source             = "./common/lambda-pubsub-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_pdf_statement_merger["env_list"],
    local.dynamic_env_list_function_pdf_statement_merger,
    local.default_env_key
  )
  service_account    = var.function_pdf_statement_merger["service_account"]
  object_key = "${var.function_pdf_statement_merger["object_key"]}/function_${var.versionConfig["function_pdf_statement_merger"]}.zip"
  name = "pdf-statement-merger"
  memory = var.function_pdf_statement_merger["memory"]
  max_instances = var.function_pdf_statement_merger["max_instances"]
  timeout = var.function_pdf_statement_merger["timeout"]
  entry_point = var.function_pdf_statement_merger["entry_point"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.service_internal_invoice,
    module.application_storage
  ]
}
resource "google_cloud_scheduler_job" "function_pdf_statement_merger_schedule" {
  name        = "pdf-statement-merger-${var.resource_version}-schedule"
  description = "schedule for pdf-statement-merger function"
  schedule    = var.function_pdf_statement_merger["schedule"]
  time_zone   = var.function_pdf_statement_merger["time_zone"]
  attempt_deadline = "1800s"
  retry_config {
    retry_count = 3
  }

  http_target {
    http_method = "POST"
    uri         = module.function_pdf_statement_merger.uri
    oidc_token {
      service_account_email = var.function_pdf_statement_merger["service_account"]
      audience = module.function_pdf_statement_merger.uri
    }
  }
  depends_on = [
    module.function_pdf_statement_merger
  ]
}

# Function sync ats invoice data
module "function_sync_ats_invoice_data" {
  source              = "./common/lambda-bucket-v2"
  infra_bucket        = var.infra_bucket
  env_list            = merge(
    var.function_sync_ats_invoice_data["env_list"], 
    local.dynamic_env_list_function_sync_ats_invoice_data,
    local.default_env_key
  )
  service_account     = var.function_sync_ats_invoice_data["service_account"]
  object_key          = "${var.function_sync_ats_invoice_data["object_key"]}/function_${var.versionConfig["function_sync_ats_invoice_data"]}.zip"
  name                = "sync-ats-invoice-data"
  memory              = var.function_sync_ats_invoice_data["memory"]
  max_instances       = var.function_sync_ats_invoice_data["max_instances"]
  timeout             = var.function_sync_ats_invoice_data["timeout"]
  entry_point         = var.function_sync_ats_invoice_data["entry_point"]
  trigger_bucket_name = module.application_storage.gp_sync_data_bucket
  resource_version    = var.resource_version
  depends_on = [
    module.enablers,
    module.service_internal_invoice,
    module.application_storage
  ]
  env = var.env
  
}

###-------------------------------###
module "function_ats_statement_nonmigrated_trigger" {
  source           = "./common/lambda-schedule-v2"
  infra_bucket     = var.infra_bucket
  env_list         = merge(
    var.function_ats_statement_nonmigrated_trigger["env_list"], 
    local.dynamic_function_ats_statement_nonmigrated_trigger,
    local.default_env_key
  )
  service_account  = var.function_ats_statement_nonmigrated_trigger["service_account"]
  object_key       = "${var.function_ats_statement_nonmigrated_trigger["object_key"]}/function_${var.versionConfig["function_ats_statement_nonmigrated_trigger"]}.zip"
  name             = "ats-statement-nonmigrated-trigger"
  memory           = var.function_ats_statement_nonmigrated_trigger["memory"]
  timeout          = var.function_ats_statement_nonmigrated_trigger["timeout"]
  entry_point      = var.function_ats_statement_nonmigrated_trigger["entry_point"]
  schedule         = var.function_ats_statement_nonmigrated_trigger["schedule"]
  time_zone        = var.function_ats_statement_nonmigrated_trigger["time_zone"]
  retry_count      = var.function_ats_statement_nonmigrated_trigger["retry_count"]
  min_backoff_duration = var.function_ats_statement_nonmigrated_trigger["min_backoff_duration"]
  disable_schedule = false
  depends_on = [
    module.enablers,
    module.service_internal_invoice
  ]
  resource_version = var.resource_version
  env              = var.env
  
}

module "function_invoice_pdf_generator" {
  source             = "./common/lambda-schedule-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_invoice_pdf_generator["env_list"], 
    local.dynamic_env_list_function_invoice_pdf_generator,
    local.default_env_key
  )
  service_account    = var.function_invoice_pdf_generator["service_account"]
  object_key = "${var.function_invoice_pdf_generator["object_key"]}/function_${var.versionConfig["function_invoice_pdf_generator"]}.zip"
  name = "invoice-pdf-generator"
  memory = var.function_invoice_pdf_generator["memory"]
  timeout = var.function_invoice_pdf_generator["timeout"]
  entry_point = var.function_invoice_pdf_generator["entry_point"]
  schedule = var.function_invoice_pdf_generator["schedule"]
  time_zone = var.function_invoice_pdf_generator["time_zone"]
  disable_schedule = false
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage,
    module.service_internal_invoice
  ]
}

module "function_ats_statement_processor" {
  source = "./common/lambda-pubsub-v2"
  infra_bucket =  var.infra_bucket
  env_list   = merge(
    var.function_ats_statement_processor["env_list"], 
    local.dynamic_env_list_function_ats_statement_processor,
    local.default_env_key
  )
  service_account    = var.function_ats_statement_processor["service_account"]
  object_key = "${var.function_ats_statement_processor["object_key"]}/function_${var.versionConfig["function_ats_statement_processor"]}.zip"
  name = "ats-statement-processor"
  memory = var.function_ats_statement_processor["memory"]
  max_instances = var.function_ats_statement_processor["max_instances"]
  timeout = var.function_ats_statement_processor["timeout"]
  entry_point = var.function_ats_statement_processor["entry_point"]
  minimum_backoff = var.function_ats_statement_processor["min_backoff_duration"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

module "function_cms_statement_processor" {
  source = "./common/lambda-pubsub-v2"
  infra_bucket =  var.infra_bucket
  env_list   = merge(
    var.function_cms_statement_processor["env_list"], 
    local.dynamic_env_list_function_cms_statement_processor,
    local.default_env_key
  )
  service_account    = var.function_cms_statement_processor["service_account"]
  object_key = "${var.function_cms_statement_processor["object_key"]}/function_${var.versionConfig["function_cms_statement_processor"]}.zip"
  name = "function-cms-statement-processor"
  memory = var.function_cms_statement_processor["memory"]
  max_instances = var.function_cms_statement_processor["max_instances"]
  timeout = var.function_cms_statement_processor["timeout"]
  entry_point = var.function_cms_statement_processor["entry_point"]
  minimum_backoff = var.function_cms_statement_processor["min_backoff_duration"]
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

module "function_ats_balance_loader" {
  source             = "./common/lambda-bucket-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_ats_balance_loader["env_list"],
   local.dynamic_env_list_function_ats_balance_loader,    
   local.default_env_key
)
  service_account    = var.function_ats_balance_loader["service_account"]
  object_key = "${var.function_ats_balance_loader["object_key"]}/function_${var.versionConfig["function_ats_balance_loader"]}.zip"
  name = "ats-balance-loader"
  memory = var.function_ats_balance_loader["memory"]
  max_instances = var.function_ats_balance_loader["max_instances"]
  timeout = var.function_ats_balance_loader["timeout"]
  entry_point = var.function_ats_balance_loader["entry_point"]
  trigger_bucket_name = module.application_storage.closing_balance_bucket
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.enablers
  ]
}

module "function_recon_processor" {
  source = "./common/lambda-pubsub-v2"
  infra_bucket =  var.infra_bucket
  env_list   = merge(
    var.function_recon_processor["env_list"], 
    local.dynamic_env_list_function_recon_processor,
    local.default_env_key
  )
  service_account    = var.function_recon_processor["service_account"]
  object_key = "${var.function_recon_processor["object_key"]}/function_${var.versionConfig["function_recon_processor"]}.zip"
  name = "recon-processor"
  memory = var.function_recon_processor["memory"]
  max_instances = var.function_recon_processor["max_instances"]
  timeout = var.function_recon_processor["timeout"]
  entry_point = var.function_recon_processor["entry_point"]
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

module "function_recon_invoker" {
  source             = "./common/lambda-bucket-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(var.function_recon_invoker["env_list"],
   local.dynamic_env_list_function_recon_invoker,    
   local.default_env_key
)
  service_account    = var.function_recon_invoker["service_account"]
  object_key = "${var.function_recon_invoker["object_key"]}/function_${var.versionConfig["function_recon_invoker"]}.zip"
  name = "recon-invoker"
  memory = var.function_recon_invoker["memory"]
  max_instances = var.function_recon_invoker["max_instances"]
  timeout = var.function_recon_invoker["timeout"]
  entry_point = var.function_recon_invoker["entry_point"]
  trigger_bucket_name = module.application_storage.recon_gp_data
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.enablers
  ]
}

module "function_marketing_impact_generator" {
  source             = "./common/lambda-schedule-v2"
  infra_bucket       = var.infra_bucket
  env_list   = merge(
    var.function_marketing_impact_generator["env_list"], 
    local.dynamic_env_list_function_marketing_impact_generator,
    local.default_env_key
  )
  service_account    = var.function_marketing_impact_generator["service_account"]
  object_key = "${var.function_marketing_impact_generator["object_key"]}/function_${var.versionConfig["function_marketing_impact_generator"]}.zip"
  name = "marketing-impact-generator"
  memory = var.function_marketing_impact_generator["memory"]
  timeout = var.function_marketing_impact_generator["timeout"]
  entry_point = var.function_marketing_impact_generator["entry_point"]
  schedule = var.function_marketing_impact_generator["schedule"]
  time_zone = var.function_marketing_impact_generator["time_zone"]
  disable_schedule = false
  resource_version= var.resource_version
  env = var.env
  
  depends_on = [
    module.enablers,
    module.application_storage,
    module.service_internal_invoice
  ]
}

module "function_cms_atpt_processor" {
  source = "./common/lambda-pubsub-v2"
  infra_bucket =  var.infra_bucket
  env_list   = merge(
    var.function_cms_atpt_processor["env_list"], 
    local.dynamic_env_list_function_cms_atpt_processor,
    local.default_env_key
  )
  service_account    = var.function_cms_atpt_processor["service_account"]
  object_key = "${var.function_cms_atpt_processor["object_key"]}/function_${var.versionConfig["function_cms_atpt_processor"]}.zip"
  name = "cms-atpt-processor"
  memory = var.function_cms_atpt_processor["memory"]
  max_instances = var.function_cms_atpt_processor["max_instances"]
  timeout = var.function_cms_atpt_processor["timeout"]
  entry_point = var.function_cms_atpt_processor["entry_point"]
  resource_version= var.resource_version
  env = var.env
  depends_on = [
    module.enablers,
    module.application_storage
  ]
}

module "statements_service" {
  source           = "./common/cloudrun"
  env_list     =  merge(var.statements_service["env_list"], local.dynamic_env_list_statements_service)
  secret_key_list = { "POSTGRES_URL" : local.sample_db_secret_key }
  service_name     = "statements-service"
  image_name       = "gcr.io/${local.gcp_project}/${var.statements_service["image_tag"]}:${var.versionConfig["statements_service"]}"
  max_scale        = var.statements_service["max_scale"]
  memory           = var.statements_service["memory"]
  container_concurrency = var.statements_service["container_concurrency"]
  cpu              = var.statements_service["cpu"]
  service_account =  var.statements_service["service_account"]
  request_timeout =  var.statements_service["request_timeout"]
  member = "serviceAccount:${var.statements_service["service_account"]}"
  annotations = {
        "client.knative.dev/user-image" = "gcr.io/${local.gcp_project}/${var.statements_service["image_tag"]}:${var.versionConfig["statements_service"]}"
        "autoscaling.knative.dev/maxScale"      = "${var.statements_service["max_scale"]}"
        "autoscaling.knative.dev/minScale"        = "${var.statements_service["min_scale"]}"
        "run.googleapis.com/vpc-access-connector" = "${var.env}-connector"
        "run.googleapis.com/vpc-access-egress" = "all-traffic"
  }
  service_annotations = {
        "run.googleapis.com/ingress" = "${var.env == "prod" || var.env == "uat" ? "internal" : "all"}"
  }

  resource_version= var.resource_version
  depends_on = [
    module.enablers
  ]
}

# module "app_statement_file_input_processor" {
#   source          = "./common/app-engine"
#   name            = var.app_statement_file_input_processor["object_key"]
#   env_list        = var.app_statement_file_input_processor["env_list"]
#   infra_bucket    = var.infra_bucket
#   object_key      = "${var.app_statement_file_input_processor["object_key"]}/${var.versionConfig["app_statement_file_input_processor"]}.zip"
#   service_account = var.app_statement_file_input_processor["service_account"]
#   version_id      = var.versionConfig["app_statement_file_input_processor"]
#   max_instances   = var.app_statement_file_input_processor["max_instances"]
# }
