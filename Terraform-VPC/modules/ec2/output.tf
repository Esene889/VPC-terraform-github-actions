output "instaces" {
  value = aws_instances.web.*.Id

}
