# Usage

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | A unique name for the resource, required by GCE. Changing this forces a new resource to be created. | `string` | `NA` | yes |
| machine\_type | The machine type to create. | `string` | `NA` | yes |
| zone | The zone that the machine should be created in. If it is not provided, the provider zone is used. | `string` | `default` | no |
| tags |  A list of network tags to attach to the instance. | `string` | `[]` | no |
| boot_disk | The boot disk for the instance. | `list(map(string))` | `NA` | yes |
| metadata | Metadata key/value pairs to make available from within the instance. Ssh keys attached in the Cloud Console will be removed. Add them to your config in order to keep them attached to your instance. | `Depending on the OS` | `NA` | no |
| network_interface | Multiples network attributes | `list(map(string))` | `NA` | yes |

# Service Account

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression to comply with RFC1035. Changing this forces a new | `string` | - | yes |
| display_name | The display name for the service account. Can be updated without creating a new resource. | `string` | - | no |

# Project IAM Member

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression to comply with RFC1035. Changing this forces a new | `string` | - | yes |
| role | The role that should be applied. Only one google_project_iam_binding can be used per role. Note that custom roles must be of the format projects/organizations/parent-name/roles/role-name | `string` | - | yes |
| member | Identities that will be granted the privilege in role. | `list` | - | yes |

### Configure a Service Account
In order to execute this module you must have a Service Account with the following roles:

- compute.disks.create
- compute.firewalls.get
- compute.instances.create
- compute.instances.delete
- compute.instances.get
- compute.instances.setMetadata
- compute.instances.setServiceAccount
- compute.instances.setTags
- compute.subnetworks.use
- compute.subnetworks.useExternalIp
- compute.zones.get

Startup Script can be found under compute_instance/startup.sh

- [More information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#tags)

### Configure a Service Account
In order to execute this module you must have a Service Account with the following project roles:

- apigateway.apiconfigs.getIamPolicy
- apigateway.apiconfigs.setIamPolicy
- iam.serviceAccounts.create
- iam.serviceAccounts.delete
- iam.serviceAccounts.get

[Service Account information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)
[Project IAM information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member)
[Service Account Key information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_key)
