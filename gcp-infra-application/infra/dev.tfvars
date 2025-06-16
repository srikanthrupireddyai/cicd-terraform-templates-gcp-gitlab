resource_version = ""
infra_bucket="sample-dev-infra"
env="dev"
service_internal_invoice = {
  "env_list" : {
    "SYNCHRONIZE_DB" : "true",
    "DUPLICATE_CHECK_DAYS" : "1095",
    "HASH_SALT": "134jrk34nlj13bhlk13b1lh2k34bk1234",
    "STATEMENT_TOPIC": "projects/possible-fabric-320701/topics/pubsub-pdf-statement-generator-topic",
    "PDF_MERGER_TOPIC": "projects/possible-fabric-320701/topics/pubsub-pdf-statement-merger-topic",
    "ARCHIVE_BUCKET"="sample-dev-file-archive"
  },
  "image_tag" : "service-internal-invoice-v2",
  "max_scale" : "40",
  "min_scale" : "0",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "vpc_connector" : "",
  "cpu" : "1",
  "memory" : "4096Mi",
  "container_concurrency" : "50",
  "request_timeout" :"600"
}

statements_service = {
  "env_list" : {
    "SYNCHRONIZE_DB" : "true",
    "DUPLICATE_CHECK_DAYS" : "1095",
    "HASH_SALT": "134jrk34nlj13bhlk13b1lh2k34bk1234",
    "STATEMENT_TOPIC": "projects/possible-fabric-320701/topics/pubsub-pdf-statement-generator-topic",
    "PDF_MERGER_TOPIC": "projects/possible-fabric-320701/topics/pubsub-pdf-statement-merger-topic",
    "ARCHIVE_BUCKET"="sample-dev-file-archive"
  },
  "image_tag" : "statements-service-v2",
  "max_scale" : "40",
  "min_scale" : "0",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "vpc_connector" : "",
  "cpu" : "1",
  "memory" : "4096Mi",
  "container_concurrency" : "50",
  "request_timeout" :"600"
}

function_myob_transaction = {
  env_list = {
  }
  "entry_point" : "myobTransaction",
  "object_key" : "function-myob-transaction",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "max_instances" : "10",
  "memory": "2048M",
  "timeout": "540"
}

function_file_mover = {
  "env_list" : {
    "SSH_SECRECTS_PATH" : "projects/1046064221593/secrets/sample-dev-ssh-secrets/versions/latest"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  }
  "schedule" : "*/15 * * * 1-5",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-file-mover",
  "entry_point" : "fileMover",
  "time_zone": "Pacific/Auckland",
  "memory": "2048M",
  "timeout": "540"
}

function_statement_file_input_processor = {
  "env_list" : {
    "sample_ACCOUNT" : "02 0836 0088452 00",
    "sample_ACCOUNT_NAME" : "sample NZ Limited",
    "sample_REFERENCE" : "12345678",
    "sample_CODE": "sample_CODE",
    "FROM":  "abbas.mashahaddy@techwondoe.com",
    "TO": "abbas.mashahaddy@techwondoe.com"
  }
  "schedule" : "30 23 * * *",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-statement-file-input-processor",
  "entry_point" : "parseACTextFile",
  "time_zone": "Pacific/Auckland",
  "memory": "2048M",
  "timeout": "1680"
}

function_notification_processor = {
  "env_list" : {
    "SSM_NOTIFICATION_KEY" : "projects/1046064221593/secrets/sample-dev-notification-secrets/versions/latest",
    "PROJECT_ID" : "possible-fabric-320701",
    "PUBSUB_TOPIC" : "pubsub-notification-processor-topic"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-notification-processor",
  "entry_point" : "notificationProcessor",
  "max_instances" : "10",
  "memory": "256",
  "timeout": "120"
}

function_cashmanager_extract = {
  env_list = {
  }
  "entry_point" : "cashManagerTransaction",
  "object_key" : "function-cashmanager-extract",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "max_instances" : "10",
  "memory": "2048M",
  "timeout": "540"
}


function_non_pdf_invoice_processor = {
  "env_list" : {
    "MOCK_CMS_AUTHORIZATION" : "true",
    "SAVE_CMS_NON_MIGRATED_FILE" : "true",
    "ENVIRONMENT": "DEV",
    "FIXED_DISCOUNT_MOBIL_NONCOMMERCIAL":"0.12"
    "FROM_EMAIL": "abbas.mashahaddy@techwondoe.com",
    "EMAIL_ID": "yash.sahsani@techwondoe.com",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "object_key" : "function-non-pdf-invoice-processor",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "csvParser",
  "max_instances" : "20",
  "memory": "512",
  "timeout": "540"
}

function_pdf_statement_generator = {
  "env_list" : {
    "LOGO_BUCKET": "sample-dev-merchant-logo"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-pdf-statement-generator",
  "entry_point" : "handler",
  "max_instances" : "100",
  "memory": "4096M",
  "timeout": "300"
}

function_balance_zero_off_processor = {
  "env_list": {

  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-balance-zero-off-processor",
  "entry_point" : "handler",
  "max_instances" : "10",
  "memory" : "2048M",
  "timeout" : "3600"
}

function_apl_settlement_report = {
  "env_list" : {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-apl-settlement-report",
  "entry_point" : "aplSettlementReport",
  "max_instances" : "10",
  "memory": "1024M",
  "timeout": "600"
}

function_cms_input_file_extractor={
  "env_list" : {
    "ENVIRONMENT": "dev"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-cms-input-file-extractor",
  "entry_point" : "cmsInputFileExtractor",
  "schedule": "0 16 * * *",
  "time_zone": "Pacific/Auckland",
  "memory": "256",
  "timeout": "60"
}

function_cms_online_authorisation = {
  "env_list" : {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-cms-online-authorisation",
  "entry_point" : "cmsOnlineAuthorisation",
  "schedule" : "45 23 * * *",
  "time_zone" : "Pacific/Auckland",
  "memory": "1024",
  "timeout": "180"

}
function_lbmx_input_file_extractor={
  "env_list" : {
    "BATCH_SIZE": 5
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-lbmx-input-file-extractor",
  "entry_point" : "lbmxInputFileExtractor",
  "schedule": "* 18 * * *",
  "time_zone": "Pacific/Auckland",
  "max_instances" : "10",
  "memory": "256",
  "timeout": "60"

}

function_invoice_preprocessor={
  "env_list" : {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-invoice-preprocessor",
  "entry_point" : "invoicePreProcessor",
  "max_instances" : 10,
  "memory": "16384M",
  "timeout": 120

}

function_ats_balance_loader={
  "env_list" : {
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-ats-balance-loader",
  "entry_point" : "BalanceLoader",
  "max_instances" : 10,
  "memory": "16384M",
  "timeout": 540
}


function_recon_processor={
  "env_list" : {
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-recon-processor",
  "entry_point" : "ReconProcessor",
  "max_instances" : 10,
  "memory": "2048M",
  "timeout": "1800"
}


function_cms_atpt_processor={
  "env_list" : {
    "API_THRESHOLD": "50",
    "ATPT_FILENAME": "Transaction_",

  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-cms-atpt-processor",
  "entry_point" : "AtptProcessor",
  "max_instances" : 10,
  "memory": "2048M",
  "timeout": "1800"
}

function_recon_invoker={
  "env_list" : {
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-recon-invoker",
  "entry_point" : "ReconInvoker",
  "max_instances" : 10,
  "memory": "16384M",
  "timeout": 540
}


function_sync_crm_data={
  "env_list" : {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-sync-crm-data",
  "entry_point" : "crmDataLoader",
  "max_instances" : "10",
  "memory": "1024",
  "timeout": "540"
}

function_pdf_invoice_processor={
  "env_list" : {
    "DOCUMENT_AI_PROCESSOR": "projects/1046064221593/locations/us/processors/f0ff62c95e91c498",
    "FAILURE_EMAIL_FROM": "abbas.mashahaddy@techwondoe.com",
    "FAILURE_EMAIL_TO": "abbas.mashahaddy@techwondoe.com",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-pdf-invoice-processor",
  "entry_point" : "invoiceParser",
  "max_instances" : "10",
  "memory": "1024",
  "timeout": "300"
}

service_cms_proxy = {
  "env_list" : {
    "cmsBaseUrl" : "https://34.151.89.42",
    "keyFile" : "encrypted-key.dev",
    "keyRingId": "cmsproxy",
    "keyId" : "hsmkey",
    "SMS_FLAG": "1",
    "KEY_FILE_NAME": "cms-encryption-key",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "image_tag" : "cms-proxy",
  "max_scale" : "3",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "auth_config_key" : "secrets-sample-dev-auth-config",
  "cpu" : "1",
  "memory" : "512Mi",
  "container_concurrency" : "80",
  "request_timeout": "100"
}

service_crm_proxy = {
  "env_list" : {
    "CRM_BASE_URL" : "https://atsuat.sample.co.nz:444/api/data/v9.1"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "image_tag" : "service-crm-proxy",
  "max_scale" : "3",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "auth_config_key" : "sample-dev-crm-auth-config",
  "cpu" : "1",
  "memory" : "512Mi",
  "container_concurrency" : "80",
  "request_timeout": "100"
}

service_external_client_proxy = {
  "env_list" : {
    "SYNCHRONIZE_DB" : "true",
    "PROJECT_ID" : "possible-fabric-320701",
    "ALLOWED_IPS": "103.195.203.160",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "image_tag" : "external-client-proxy",
  "max_scale" : "3",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com"
  "auth_config_key" : "secrets-sample-dev-auth-config"
  "external_client_http_config_key": "sample-dev-external-http-client-config",
  "cpu" : "1",
  "memory" : "512Mi",
  "container_concurrency" : "80",
   "request_timeout": "100"
}

function_cms_output_file_processor={
  "env_list" : {
    "api_threshold": "50",
    "BATCH_FILENAME": "TRM_BatchAuthorizationRESP_RLC_",
    "ATPT_FILENAME": "Transaction_",
    "BATCH_REJ_FILENAME": "TRM_BatchAuthorizationPreRej_RLC_",
    "PREFIX_OF_AMED_FILENAME": "EmbosserDetails_",
    "PREFIX_OF_RESPONSE_FILENAME": "AccountOnboarding_RESP_",
    "PREFIX_OF_BATCH_SMS_ALERT":"SMS_BATCH_RCO_",
    "PREFIX_OF_o53_report":"RCOMBS",
    "GL_INTEGRATION":"GeneralLedger_RC",
    "ATGI":"ATGI"
    "MTGI":"MTGI"
    "GOOGLE_NODE_RUN_SCRIPTS"=""

  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-cms-output-file-processor",
  "entry_point" : "CMSMasterOutputFileProcessor",
  "max_instances" : "10",
  "memory": "512",
  "timeout": "120"
}


function_cms_batch_authorisation_file={
  "env_list" : {
    "CONFIG_FILE_NAME":"split-payment-merchants/splitPaymentsMerchants.json",
    "ENVIRONMENT": "dev",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-cms-batch-authorisation-file",
  "entry_point" : "CMSMasterBatchAuthorisation",
  "max_instances" : "10",
  "memory": "256",
  "timeout": "60"
}

function_invoice_reporting={
  "env_list" : {
    "EMAIL_TO": "mirza.asim@techwondoe.com,shanthan.annedi@techwondoe.com"
    "SPLIT_PAYMENT_TO_EMAIL": "piravin.kcm@techwondoe.com,shanthan.annedi@techwondoe.com"
    "SUPPORT_EMAIL": "piravin.kcm@techwondoe.com,shanthan.annedi@techwondoe.com"
    "FROM_EMAIL": "abbas.mashahaddy@techwondoe.com"
    "ENVIRONMENT": "DEV",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-invoice-reporting",
  "entry_point" : "invoiceReporting",
  "endpoints": [
    {
      "endpoint": "invoice",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "invoice-file",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "splitpayment-invoices",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "failed-invoices",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "rejected-invoices",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "mobil-commercial",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "line-items",
      "schedule": "0 0 1 * *"
    },
    {
      "endpoint": "invoice-pdf",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "invoice-lbmx",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "statement-gen",
      "schedule": "30 23 * * *"
    },
    {
      "endpoint": "statement-merge",
      "schedule": "30 23 * * *"
    },
     {
      "endpoint": "cmsinvoiceupdating",
      "schedule": "30 23 * * *"
    },
     {
      "endpoint": "batchinvoiceupdating",
      "schedule": "30 23 * * *"
    }
  ]
  "time_zone": "Pacific/Auckland",
  "memory": "1024",
  "timeout": "180"
}

function_cms_alerts_processor = {
  "env_list" : {
    "FROM_EMAIL": "abbas.mashahaddy@techwondoe.com"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "object_key" : "function-cms-alerts-processor",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "cmsAlertsProcessor",
  "max_instances" : 3,
  "memory": "256M",
  "timeout": 60
}

function_invoice_alert_generator = {
  "env_list" : {
    "FROM_EMAIL": "abbas.mashahaddy@techwondoe.com",
    "EMAIL_ID": "srikanth.rupireddy@techwondoe.com",
    "ENVIRONMENT" : "DEV"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "object_key" : "function-invoice-alert-generator",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "InvoiceMasterAlertGenerator",
  "schedule" : "30 23 * * *",
  "time_zone": "Pacific/Auckland",
  "memory": "1024",
  "timeout": "540"
}

function_invoice_pdf_generator = {
  "env_list" : {
    "NUMBER_OF_MESSAGE_TO_PUBLISH": "500",
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "object_key" : "function-invoice-pdf-generator",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "InvoicePdfGenerator",
  "schedule" : "30 23 * * *",
  "time_zone": "Pacific/Auckland",
  "timeout": "540",
  "memory" : "2048M",
}
function_marketing_impact_generator = {
  "env_list" : {
  },
  "object_key" : "function-marketing-impact-generator",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "MarketingImpactGenerator",
  "schedule" : "30 23 * * *",
  "time_zone": "Pacific/Auckland",
  "timeout": "3600",
  "memory" : "2048M",
}
function_invoice_pdf_copier = {
  env_list = {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "object_key" : "function-invoice-pdf-copier"
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com"
  "entry_point" : "invoicePdfCopier",
  "max_instances" : "10",
  "memory": "1024M",
  "timeout": "1800"
}

function_application_processor = {
  env_list = {
    "POSTGRES_URL": "projects/1046064221593/secrets/secret_sampledb/versions/latest"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  }
  "entry_point" : "applicationProcessor",
  "object_key" : "function-application-processor",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "max_instances" : "10",
  "memory": "512",
  "timeout": "120"
}

function_cardholder_batch_onboarding = {
  "env_list" : {
    "PREFIX_OF_AMED_FILENAME": "EmbosserDetails_",
    "PREFIX_OF_RESPONSE_FILENAME": "AccountOnboarding_RESP_"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-cardholder-batch-onboarding",
  "entry_point" : "cardHolderBatchOnBoarding",
  "max_instances" : "10",
  "memory": "1024M",
  "timeout": "1800"
}

function_merchant_settlement = {
  "env_list" : {
    "DST_DIR"="merchant_settlement"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-merchant-settlement",
  "entry_point" : "merchantSettlement",
  "max_instances" : "10",
  "memory": "1024",
  "timeout": "540"
}

function_xero_transaction = {
  env_list = {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  }
  "entry_point" : "xeroTransaction",
  "object_key" : "function-xero-transaction",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "max_instances" : "10",
  "memory": "2048M",
  "timeout": "540"
}

function_onboarding_data_generator={
  "env_list" : {
    "CRM_BASE_URL": "https://atsuat.sample.co.nz:444/api/data/v9.1",
    "BANK_FILE_NAME": "gl/Member bank numbers.txt",
    "USER_FILE_NAME": "cms-onboarding-input/input.xlsx",
    "CRM_AUTH_CONFIG": "projects/1046064221593/secrets/sample-dev-crm-auth-config/versions/latest",
    "OUTPUT_FILE_NAME": "cms-onboarding-output"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-onboarding-data-generator",
  "entry_point" : "dataGenerator",
  "max_instances" : "10",
  "memory": "1024M",
  "timeout": "300"
}

function_pdf_statement_merger = {
  "env_list": {
    "PDF_SUFFIXES": "_AAD,_ATS,_CMS,_AAA",
    "ARCHIVE_BUCKET": "sample-dev-file-archive"
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "entry_point" : "pdfStatementMerger",
  "object_key" : "function-pdf-statement-merger",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "max_instances" : "10",
  "memory": "4096M",
  "timeout": "540",
  "schedule": "30 23 * * *",
  "time_zone" : "Pacific/Auckland"
}

function_sync_ats_invoice_data = {
  "env_list" : {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
  },
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-sync-ats-invoice-data",
  "entry_point" : "atsStatementDataLoader",
  "max_instances" : "10",
  "memory": "2048M",
  "timeout": "540"
}

function_ats_statement_nonmigrated_trigger = {
  "env_list" : {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
    "CHUNKSIZE" : 150
  }
  "schedule" : "0 0 6 * *",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-ats-statement-nonmigrated-trigger",
  "entry_point" : "trigger",
  "time_zone" : "Pacific/Auckland",
  "memory" : "2048M",
  "timeout" : "1680",
  "min_backoff_duration" : "900s",
  "retry_count": 5
}

function_ats_statement_processor = {
  entry_point = "atsStatementProcessor"
  max_instances = "20"
  memory = "2048M"
  object_key = "function-ats_statement_processor"
  service_account = "possible-fabric-320701@appspot.gserviceaccount.com"
  timeout = "3600"
  min_backoff_duration : "600s",
  env_list = {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
    "SUBSCRIPTION_NAME" = "projects/possible-fabric-320701/subscriptions/pubsub-ats-statement-processor-topic-subscription"
  }
}

function_cms_statement_processor = {
  entry_point = "cmsStatementProcessor"
  max_instances = "20"
  memory = "2048M"
  object_key = "function-cms-statement-processor"
  service_account = "possible-fabric-320701@appspot.gserviceaccount.com"
  timeout = "3600"
  min_backoff_duration : "600s",
  env_list = {
    "GOOGLE_NODE_RUN_SCRIPTS"=""
    "SUBSCRIPTION_NAME" = "projects/possible-fabric-320701/subscriptions/pubsub-cms-statement-processor-topic-subscription"
    "sample_ACCOUNT" : "02 0836 0088452 00",
    "sample_ACCOUNT_NAME" : "sample NZ Limited",
    "sample_REFERENCE" : "12345678",
    "sample_CODE": "sample_CODE",
    "FROM":  "srikanth.rupireddy@techwondoe.com",
    "TO": "srikanth.rupireddy@techwondoe.com"
  }
}

app_statement_file_input_processor = {
  env_list = {
    "GOOGLE_NODE_RUN_SCRIPTS" = ""
    "PORT"                    = 8080
  }
  object_key      = "app-statement-file-input-processor"
  service_account = "possible-fabric-320701@appspot.gserviceaccount.com"
  max_instances   = 1
}