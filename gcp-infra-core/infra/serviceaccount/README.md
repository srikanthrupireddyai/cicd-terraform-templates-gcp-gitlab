# serviceaccount

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_name"></a> [gcp\_project\_name](#input\_gcp\_project\_name) | The name of the GCP project where the db and Cloud SQL Proxy will be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The service account name (e.g. cloud-sql-proxy) | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The role assigned to the service account (e.g. roles/cloudsql.editor) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_email"></a> [email](#output\_email) | n/a |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
