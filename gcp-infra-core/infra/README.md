# infra

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.12.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.36.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.36.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | ./db | n/a |
| <a name="module_dbproxy"></a> [dbproxy](#module\_dbproxy) | ./dbproxy | n/a |
| <a name="module_gcpapis"></a> [gcpapis](#module\_gcpapis) | ./api | n/a |
| <a name="module_permissions"></a> [permissions](#module\_permissions) | ./sa-users | n/a |
| <a name="module_serviceaccount"></a> [serviceaccount](#module\_serviceaccount) | ./serviceaccount | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ./storage | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db"></a> [db](#input\_db) | n/a | <pre>object({<br>    env_list : map(string)<br>    disk_size : number<br>    instance_type : string<br>    user : string<br>    database_version : string<br>  })</pre> | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Db passowrd | `string` | n/a | yes |
| <a name="input_dbproxy"></a> [dbproxy](#input\_dbproxy) | n/a | <pre>object({<br>    env_list : map(string)<br>    machine_type : string<br>    image : string<br>    size : number<br>    type : string<br>  })</pre> | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | n/a | <pre>object({<br>    prefix : string<br>  })</pre> | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | n/a | `string` | n/a | yes |
| <a name="input_serviceaccount"></a> [serviceaccount](#input\_serviceaccount) | n/a | <pre>object({<br>    name : string<br>    role : string<br>  })</pre> | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | <pre>object({<br>    env_list : map(string)<br>    machine_type : string<br>    min_instances : number<br>    max_instances : number<br>    ip_cidr_range : string<br>    vpc_connector_cidr_range : string<br>    subnetwork_cidr_range : string<br>  })</pre> | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sample_db_key"></a> [sampl\_db\_key](#output\_sampl\_db\_key) | n/a |
| <a name="output_sampl_db_private_ip"></a> [sampl\_db\_private\_ip](#output\_sampl\_db\_private\_ip) | n/a |
| <a name="output_sampl_db_public_ip"></a> [sampl\_db\_public\_ip](#output\_sampl\_db\_public\_ip) | n/a |
| <a name="output_sampl_db_sectret_key_version"></a> [sampl\_db\_sectret\_key\_version](#output\_sampl\_db\_sectret\_key\_version) | ssm key version |
| <a name="output_sampl_db_sectret_name"></a> [sampl\_db\_sectret\_name](#output\_sampl\_db\_sectret\_name) | ssm key name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
