variable "region" {
  description = "AWS Region where the infrastructure will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the main VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "root_domain" {
  description = "Root domain for SSL certificate validation."
  type        = string
}

variable "dns_record_ttl" {
  description = "Time-to-live (TTL) for DNS validation records in seconds."
  type        = number
  default     = 300
}

variable "ssh_allowed_ip" {
  description = "List of IP addresses allowed to access the EC2 instance via SSH."
  type        = list(string)
  default     = ["70.95.33.243/32"] # Replace with your IP or an array of IPs
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "ssh_key" {
  description = "Name of the SSH key pair to use for EC2 instance access."
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "alb_name" {
  description = "Name of the Application Load Balancer."
  type        = string
  default     = "takehome-alb"
}

variable "tag_environment" {
  description = "Tag for identifying the environment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}
