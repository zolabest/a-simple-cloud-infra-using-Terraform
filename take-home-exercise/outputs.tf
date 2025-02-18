output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "List of public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "List of private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer."
  value       = aws_lb.alb.dns_name
}

output "ec2_private_ip" {
  description = "Private IP of the EC2 instance."
  value       = aws_instance.web.private_ip
}

output "ssl_cert_arn" {
  description = "The ARN of the SSL Certificate (if applicable)."
  value       = try(aws_acm_certificate.ssl_certificate.arn, null)
}
output "alb_https_url" {
  description = "HTTPS URL for the Load Balancer"
  value       = "https://${aws_lb.alb.dns_name}"
}
