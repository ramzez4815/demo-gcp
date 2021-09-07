# Usage

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


# GCS

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | - | no |
| pubsub_topic | The name of the pubsub topic | `string` | - | yes |
| pubsub_sub_name | The name of the subcriber | `string` | - | yes |
| ack_deadline | This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. After message delivery but before the ack deadline expires and before the message is acknowledged, it is an outstanding message and will not be delivered again during that time (on a best-effort basis). | `number` | `10 secs` | no |


### Configure a Service Account
In order to execute this module you must have a Service Account with the following project roles:

- pubsub.subscriptions.consume
- storage.objects.create

[Pubsub information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription)
