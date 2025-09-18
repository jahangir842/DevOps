output "connect_instance_id" {
  value = aws_connect_instance.this.id
}

output "connect_instance_alias" {
  value = aws_connect_instance.this.instance_alias
}
