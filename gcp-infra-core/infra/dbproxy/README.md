# dbproxy

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.36.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_serviceaccount"></a> [serviceaccount](#module\_serviceaccount) | ../serviceaccount | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.db_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_instance_name"></a> [db\_instance\_name](#input\_db\_instance\_name) | The name of the Cloud SQL db, e.g. my-project:us-centra1:my-sql-db | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | current environment | `string` | n/a | yes |
| <a name="input_gcp_project_name"></a> [gcp\_project\_name](#input\_gcp\_project\_name) | The name of the GCP project where the db and Cloud SQL Proxy will be created | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | n/a | `string` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The type of VM you want, e.g. f1-micro, c2-standard-4 | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region that the proxy instance will run in (e.g. us-central1) | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | prefix for the resource names | `string` | `"sample"` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | n/a | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | n/a | `number` | n/a | yes |
| <a name="input_subnetwork_id"></a> [subnetwork\_id](#input\_subnetwork\_id) | n/a | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC that the proxy instance will run in | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where the VM will be created, e.g. us-centra1-a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP of the bastion instance running Cloud SQL Proxy |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
