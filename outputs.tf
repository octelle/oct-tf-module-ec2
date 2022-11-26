output "id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instance.id
}

output "public_ip" {
  description = "The public elastic IP for the instance"
  value       = aws_eip.this[*].public_ip
}
