# Usage

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


# GCS

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | - | no |
| pubsub_topic_name | The name of the pubsub topic | `string` | - | no |
| scheduler_name | The name of the job. | `string` | - | yes |
| scheduler_description | A human-readable description for the job. This string must not contain more than 500 characters. | `string` | - | no |
| scheduler_time_zone | Specifies the time zone to be used in interpreting schedule. The value of this field must be a time zone name from the tz database. | `string` | - | no |
| scheduler_region | Region where the scheduler job resides. If it is not provided, Terraform will use the provider default. | `string` | - | no |


### Configure a Service Account
In order to execute this module you must have a Service Account with the following project roles:

- Cloud Scheduler admin

[Scheduler information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job)
