variable "bucket_tfstate" {
  type    = string
  default = "privatelink-endpoint-kadragon-tfstate"
}

variable "main_zone" {
  type    = string
  default = "ap-northeast-2"
}

variable "ptfe_service" {
  type    = string
  default = "com.amazonaws.vpce.ap-northeast-2.vpce-svc-0d90cf62dae682b84"
}
