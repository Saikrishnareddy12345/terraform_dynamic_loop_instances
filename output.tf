# output "Instance_id" {
#   description = "display the instance Instance_id"
#   value       = [for instance in aws_instance.ec21 : instance.id]
# }

# output "public_ip" {
#   description = "display the public ip[ of the instances"
#   value       = [for instance in aws_instance.ec21 : instance.public_ip]
# }
output "instances" {
  value       = aws_instance.web
  description = "All Machine details"
}
