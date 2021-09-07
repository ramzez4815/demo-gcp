variable "project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "pubsub_topic_name" {
  type        = string
  description = "Pubsub topic name"
}
variable "pubsub_sub_name" {
  type        = string
  description = "PubSub Subscriber Name"
}
variable "ack_deadline" {
  type        = number
  description = "PubSub Ack Deadline"
}
