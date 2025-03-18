
resource "alicloud_vpc" "vpc" {
  vpc_name       = "tf_test"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  vswitch_name      = "tf-vs-66"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "172.16.66.0/24"
  zone_id = var.az
}

resource "alicloud_security_group" "group" {
  name   = "terraform-test"
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}
