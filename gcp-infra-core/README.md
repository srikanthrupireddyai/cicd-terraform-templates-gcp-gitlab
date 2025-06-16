# Setting up pre-commit hook (Mendatory for Everyone)

```
pip install pre-commit (For Debians)
brew install pre-commit (For MAC OS)
```
# Run pre-commit install to set up the git hook scripts

```
$ pre-commit install 
  pre-commit installed at .git/hooks/pre-commit
```

# (optional) Run against all the files

- It's usually a good idea to run the hooks against all of the files when adding new hooks : 
```pre-commit run -a```
- Usually pre-commit will only run on the changed files during git hooks


# Setting up service account for base terraform

# Run these command in cloud shell

gcloud services enable \
    cloudresourcemanager.googleapis.com \

# Project has two parts

- Core
- Application

 Both core and application have differerent backend. The core needs to be deployed seperately from the application

# Deploying to core

  ```
    cd infra
    export GOOGLE_PROJECT=sample-uat
    export GOOGLE_APPLICATION_CREDENTIALS=cred-uat.json
    terraform init -backend-config=backend.uat.conf
    # check if the database with the given name exists already. If so, update the name.
    terraform plan -var-file=uat.tfvars  -out=plan.cache
    terraform apply plan.cache
     
  ```
# Destroying resources 
 - First set the deleteprevention flag=false
# Deploying applicatons

  ```
    cd applications
    export GOOGLE_PROJECT=sample-uat
    terraform init --backend-config=backend.uat.conf
    terraform plan --var-file uat.tfvars -out plan.cache
    terraform apply plan.cache
  ```

# importing exisiting db

terraform import -var-file=uat.tfvars "module.db.google_sql_database_instance.main_primary" sample-uat-invoice-db

enabling database proxy
gcloud sql connect sample-uat-invoice-db

# adding the functions

1]function-sync-crm-data
2]function-invoice-pdf-generator
3]function-cms-input-file-extractor
4]function-invoice-preprocessor

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
  "object_key": "function_sync_crm_data/function.zip#a5170badefb89aafc6e6080e70112ca8",
  "service_account": "possible-fabric-320701@appspot.gserviceaccount.com",
  "entry_point" : "crmDataLoader"
}
