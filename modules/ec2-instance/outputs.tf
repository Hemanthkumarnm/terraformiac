output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.main.arn
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.main.private_ip
}

output "instance_state" {
  description = "The state of the EC2 instance"
  value       = aws_instance.main.instance_state
} 