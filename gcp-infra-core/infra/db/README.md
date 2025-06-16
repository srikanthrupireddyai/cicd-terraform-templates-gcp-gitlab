# db

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
| <a name="module_db_url_sercret"></a> [db\_url\_sercret](#module\_db\_url\_sercret) | ../secrets | n/a |

## Resources

| Name | Type |
|------|------|
| [google_sql_database.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.main_primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.db_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The version of the database | `string` | n/a | yes |
| <a name="input_db_depends_on"></a> [db\_depends\_on](#input\_db\_depends\_on) | A single resource that the database instance depends on | `any` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The db password used to connect to the Postgers db | `string` | n/a | yes |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The size in GB of the disk used by the db | `number` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | current environment | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type of the VM that will run the db (e.g. db-f1-micro, db-custom-8-32768) | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | prefix for the resource names | `string` | `"sample"` | no |
| <a name="input_user"></a> [user](#input\_user) | The username of the db user | `string` | n/a | yes |
| <a name="input_vpc_link"></a> [vpc\_link](#input\_vpc\_link) | A link to the VPC where the db will live (i.e. google\_compute\_network.some\_vpc.self\_link) | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC where the db will live | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_name"></a> [connection\_name](#output\_connection\_name) | The connection string used by Cloud SQL Proxy, e.g. my-project:us-central1:my-db |
| <a name="output_connection_sectret_key"></a> [connection\_sectret\_key](#output\_connection\_sectret\_key) | ssm key to the connections |
| <a name="output_connection_sectret_key_name"></a> [connection\_sectret\_key\_name](#output\_connection\_sectret\_key\_name) | ssm key to the connections |
| <a name="output_connection_sectret_key_version"></a> [connection\_sectret\_key\_version](#output\_connection\_sectret\_key\_version) | ssm key to the connections |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Database private ip address |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Database public ip address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
