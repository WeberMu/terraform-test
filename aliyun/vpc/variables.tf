
variable "region" {
  default = "cn-qingdao"
  description = "the availability region"
}

variable "az" { 
  default = "cn-qingdao-b" 
  description = "the availability zone" 
  }

variable "instance_name" {
  default = "aliyun-terraform-test"
}

variable "instance_count" {
  default = 1
}

