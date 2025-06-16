# Setting up service account for base terrafor

# Run these command in cloud shell

gcloud services enable \
    cloudresourcemanager.googleapis.com \

# Project has two parts

- Core
- Application

 Both core and application have differerent backend. The core needs to be deployed seperately from the application

# Deploying to core

  ```
    cd core
    export GOOGLE_PROJECT=sample-uat
    export GOOGLE_APPLICATION_CREDENTIALS=cred.uat.json
    terraform init --backend-config=backend.uat.conf
    terraform plan --var-file uat.tfvars -out plan.cache
    terraform apply plan.cache
  ```

# Deploying applicatons

  ```
    cd applications
    export GOOGLE_PROJECT=sample-uat
    export GOOGLE_APPLICATION_CREDENTIALS=cred-uat.json
    terraform init --backend-config=backend.uat.conf
    terraform plan --var-file uat.tfvars -out plan.cache
    terraform apply plan.cache
  ```

# importing exisiting db

terraform import -var-file=uat.tfvars "module.db.google_sql_database_instance.main_primary" sample-uat-invoice-db

enabling database proxy
gcloud sql connect sample-uat-invoice-db

# Adding the functions

1]function-sync-crm-data
2]function-invoice-pdf-generator
3]function-cms-input-file-extractor
4]function-invoice-preprocessor
5]function_pdf_invoice_processor

>> Add the function module in the 'main.tf' file.
e.g.: module "function_sync_crm_data"

>> Add the variables in 'variables.tf' which were used in 'main.tf' file.
e.g.: variable "function_sync_crm_data"


# Updating the storage

>> Mention the storage buckets used for function in 'main.tf' under storage section.

e.g.: resource "google_storage_bucket" "sync_crm_data_bucket" {
     name     = "${local.gcp_project}-sync-crm-data"}


>> Add the output under storage in output.tf file.
>>Terraform outputs are used to extract information about the infrastructure resources from
  the project state.

e.g.: output "sync_crm_data_bucket" {
     value = google_storage_bucket.sync_crm_data_bucket.name}


# Update the uat.tfvars file

>>Here, we will define the actual variable values with the help of few key components
like: "env_list", "object_key", "service_account" & "entry_point".

e.g.:
function_sync_crm_data={
   "env_list" :  {
      "API_URL": "https://service-internal-invoice-v2-q7wfoxk4uq-ts.a.run.app"
  },
  "object_key": "function-sync-crm-data",
  "service_account": "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "crmDataLoader"
}

# Added 3 services:

https://gitlab.com/sample/service-external-client-proxy
https://gitlab.com/sample/service-crm-proxy
https://gitlab.com/sample/service-cms-proxy



# Steps to deploy core:

    > cd infra
    > export GOOGLE_PROJECT=sample-uat
    > terraform init -backend-config=backend.uat.conf
    > terraform plan -var-file=uat.tfvars  -out=plan.cache
    > terraform apply plan.cache


# Command to destroy: 
Set the delete prevention flag to false for the database as by default database can not be deleted,
create apply from the step for deploying terraform, Once applied, create the destroy command:

    > terraform destroy --var-file=uat.tfvars



# Steps to deploy application in UAT:
Make sure version.tfvars.json file has all the correct versions for the applicaitons
Make sure that you add proper uat.tfvars file and backend.uat.conf

    > export GOOGLE_PROJECT=sample-uat
    > export GOOGLE_APPLICATION_CREDENTIALS=cred-uat.json
    > terraform init -backend-config=backend.uat.conf
    > terraform plan -var-file uat.tfvars -var-file version.tfvars.json -out plan.cache
    > terraform apply plan.cache


# Command to destroy:

    > terraform destroy -var-file uat.tfvars -var-file version.tfvars.json


# Confluence Documentation Link of the Entier Project:

1. Role Management: https://sample.atlassian.net/wiki/spaces/~6246da15247a4b00691e05f4/pages/149684491/1.+Role+Management

2. Deploying & Destroying of CORE: https://sample.atlassian.net/wiki/spaces/~6246da15247a4b00691e05f4/pages/149553330/2.+Deploying+Destroying+of+CORE

3. Deploying & Destroying of Application: https://sample.atlassian.net/wiki/spaces/~6246da15247a4b00691e05f4/pages/149619190/3.+Deploying+Destroying+of+Application

4. CI Process For The Functions & The APIs: https://sample.atlassian.net/wiki/spaces/~6246da15247a4b00691e05f4/pages/149487819/4.+CI+Process+For+The+Functions+The+APIs

# secretes required to be setup manually
## sit, uat
- external_client_http_config_key (secrets-sample-sit-external-http-client-config)
- crm_auth_config
- dbconfig