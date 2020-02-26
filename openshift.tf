provider "aws" {
access_key = "${var.access_key}"
secret_key = "${var.secret_key}"
region = "eu-west-1"
}
resource "aws_instance" "openshift"{
count = "1"
ami = "${var.ami}"
instance_type = "t2.xlarge"
key_name = "${var.ssh_key}"
}
resource "aws_ebs_volume" "example" {
  availability_zone = "eu-west-1a"
  size              = 40
  encrypted   = true
}
output "ip" {
    value = aws_instance.openshift.*.public_ip
}
output "public_dns" {
	value = aws_instance.openshift.*.public_dns
}
