# vpc

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.36.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_vpc_access_connector.serverless_vpc_connector](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_vpc_access_connector) | resource |
| [google_compute_firewall.allow_db_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_address.private_ip_block](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.serverless_egress_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.regional_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_client_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | current environment | `string` | n/a | yes |
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | n/a | `string` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | n/a | `string` | n/a | yes |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | n/a | `number` | n/a | yes |
| <a name="input_min_instances"></a> [min\_instances](#input\_min\_instances) | n/a | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the VPC to create | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | prefix for the resource names | `string` | `"sample"` | no |
| <a name="input_subnetwork_cidr_range"></a> [subnetwork\_cidr\_range](#input\_subnetwork\_cidr\_range) | n/a | `string` | n/a | yes |
| <a name="input_vpc_connector_cidr_range"></a> [vpc\_connector\_cidr\_range](#input\_vpc\_connector\_cidr\_range) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_link"></a> [link](#output\_link) | A link to the VPC resource, useful for creating resources inside the VPC |
| <a name="output_name"></a> [name](#output\_name) | The name of the VPC |
| <a name="output_private_vpc_connection"></a> [private\_vpc\_connection](#output\_private\_vpc\_connection) | The private VPC connection |
| <a name="output_subnetwork_link"></a> [subnetwork\_link](#output\_subnetwork\_link) | A link to the VPC resource, useful for creating resources inside the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
