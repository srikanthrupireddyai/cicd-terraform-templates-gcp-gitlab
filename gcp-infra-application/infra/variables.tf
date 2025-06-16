variable "env" {
    default = "" 
}
variable "resource_version" {
    default = "" 
}
variable "infra_bucket" {
    default = ""
    description = "use this only when infra bucket is different than the standard format"
}

variable "service_internal_invoice" {
    type = object({
        env_list : map(string)
        image_tag: string
        max_scale: number
        min_scale: number
        service_account: string
        vpc_connector: string
        container_concurrency: number
        request_timeout: number
        memory: string
        cpu: number
    })
}

variable "statements_service" {
    type = object({
        env_list : map(string)
        image_tag: string
        max_scale: number
        min_scale: number
        service_account: string
        vpc_connector: string
        container_concurrency: number
        request_timeout: number
        memory: string
        cpu: number
    })
}

variable "function_statement_file_input_processor" {
    type = object({
        env_list : map(string)
        schedule: string
        object_key: string
        entry_point: string
        service_account: string
        time_zone: string
        memory: string
        timeout: number
    })
}

variable "function_cashmanager_extract" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_myob_transaction" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_file_mover" {
    type = object({
        env_list : map(string)
        schedule: string
        object_key: string
        entry_point: string
        service_account: string
        time_zone: string
        memory: string
        timeout: number
    })
}

variable "function_notification_processor" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "function_pdf_statement_generator" {
     type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_balance_zero_off_processor" {
  type = object({
    env_list : map(string)
    object_key : string
    entry_point : string
    service_account : string
    max_instances : string
    memory : string
    timeout : number
  })
}


variable "function_apl_settlement_report" {
     type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_non_pdf_invoice_processor" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "function_invoice_preprocessor"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_ats_balance_loader"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_recon_processor"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}
variable "function_recon_invoker"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}
variable "function_cms_input_file_extractor"{
    type = object({
        env_list : map(string)
        schedule: string
        object_key: string
        entry_point: string
        service_account: string
        time_zone: string
        memory: number
        timeout: number
    })
}

variable "function_lbmx_input_file_extractor"{
    type = object({
        env_list : map(string)
        schedule: string
        object_key: string
        entry_point: string
        service_account: string
        time_zone: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "function_cms_online_authorisation" {
    type = object({
        env_list : map(string)
        schedule : string
        object_key : string
        entry_point : string
        service_account : string
        time_zone : string
        memory: number
        timeout: number
  })
}
variable "function_sync_crm_data"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

 variable "service_cms_proxy" {
     type = object({
         env_list : map(string)
         image_tag: string
         max_scale: number
         service_account: string
         auth_config_key: string
         request_timeout: number
         container_concurrency: number
         memory: string
         cpu: number
     })
 }

variable "function_pdf_invoice_processor"{
     type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "service_crm_proxy"{
    type = object({
         env_list : map(string)
         image_tag: string
         max_scale: number
         service_account: string
         auth_config_key: string
         request_timeout:number
         container_concurrency: number
         memory: string
         cpu: number
     })
 }


variable "service_external_client_proxy"{
    type = object({
         env_list : map(string)
         image_tag: string
         max_scale: number
         service_account: string
         auth_config_key: string
         request_timeout: number
         external_client_http_config_key: string
         container_concurrency: number
         memory: string
         cpu: number
     })
 }

variable "versionConfig" {
    type = map(string)
}

variable "function_cms_output_file_processor"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "function_cms_batch_authorisation_file"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
        
    })
}

variable "function_invoice_reporting" {
     type = object({
        env_list : map(string)
        endpoints : list(object({
            endpoint : string
            schedule : string
        }))
        object_key: string
        entry_point: string
        service_account: string
        time_zone: string  
        memory: number
        timeout: number
    })  
}

variable "function_cms_alerts_processor" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_invoice_alert_generator" {
    type = object({
        env_list : map(string)
        schedule: string
        object_key: string
        entry_point: string
        service_account: string
        time_zone: string 
        memory: number
        timeout: number
    })
}

variable "function_invoice_pdf_generator" {
  type = object({
    env_list : map(string)
    schedule : string
    object_key : string
    entry_point : string
    service_account : string
    time_zone : string
    memory : string
    timeout : number
  })
}

variable "function_marketing_impact_generator" {
  type = object({
    env_list : map(string)
    schedule : string
    object_key : string
    entry_point : string
    service_account : string
    time_zone : string
    memory : string
    timeout : number
  })
}

variable "function_cms_atpt_processor"{
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_invoice_pdf_copier" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_application_processor" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "function_cardholder_batch_onboarding"{
     type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_merchant_settlement"{
     type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: number
        timeout: number
    })
}

variable "function_xero_transaction" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number
    })
}

variable "function_onboarding_data_generator" {
    type = object({
        env_list : map(string)
        object_key: string
        entry_point: string
        service_account: string
        max_instances: string
        memory: string
        timeout: number  
    })
}

variable "function_pdf_statement_merger" {
  type = object({
    env_list: map(string)
    object_key: string
    entry_point: string
    service_account: string
    max_instances: string
    memory: string
    timeout: number
    schedule: string
    time_zone: string
  })
}

variable "function_sync_ats_invoice_data" {
  type = object({
    env_list: map(string)
    object_key: string
    entry_point: string
    service_account: string
    max_instances: string
    memory: string
    timeout: number
  })
}

variable "function_ats_statement_nonmigrated_trigger" {
  type = object({
    env_list : map(string)
    schedule : string
    object_key : string
    entry_point : string
    service_account : string
    time_zone : string
    memory : string
    timeout : number
    retry_count : number
    min_backoff_duration : string 
  })
}

variable "function_ats_statement_processor" {
  type = object({
    env_list: map(string)
    object_key: string
    entry_point: string
    service_account: string
    max_instances: string
    memory: string
    timeout: number
    min_backoff_duration : string,
  })
}

variable "function_cms_statement_processor" {
  type = object({
    env_list: map(string)
    object_key: string
    entry_point: string
    service_account: string
    max_instances: string
    memory: string
    timeout: number
    min_backoff_duration : string,
  })
}

variable "app_statement_file_input_processor" {
  type = object({
    env_list : map(string)
    object_key : string
    service_account : string
    max_instances : number
  })
}