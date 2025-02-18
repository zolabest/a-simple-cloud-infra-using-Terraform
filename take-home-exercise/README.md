
Cloud Infrastructure Take Home Exercise
This repository contains a Terraform script to provision a cloud infrastructure setup in AWS, including a VPC, subnets, security groups, an Application Load Balancer (ALB), and an EC2 instance running a simple web server.

📌 Project Overview
This Terraform script creates:

A VPC with a 10.0.0.0/16 CIDR block.
Two public subnets and two private subnets across different availability zones.
A security group for the ALB allowing HTTP and HTTPS traffic.
A security group for the EC2 instance allowing HTTP traffic from ALB and SSH from a specific IP.
An Application Load Balancer (ALB) terminating SSL with a self-signed certificate.
An EC2 instance in a private subnet, running a simple web server.
A NAT Gateway for internet access from private subnets.
An IAM Role for EC2 with Amazon SSM access.

🛠️ Prerequisite
s
Terraform v1.5+
AWS CLI configured with necessary permissions.
SSH Key Pair (.pem file) to connect to the EC2 instance.

🚀 Deployment Steps

1️⃣ Clone the Repository

git clone <repo-url>
cd <repo-folder>

2️⃣ Configure AWS Credentials

Ensure your AWS CLI is configured:

aws configure

Or, use an environment variable:

export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"

3️⃣ Modify Terraform Variables (Optional)
Edit the variables.tf file if needed:

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ssh_allowed_ip" {
  default = "YOUR_IP/32" # Replace with your IP to allow SSH access
}

variable "ssh_key" {
  default = "your-ssh-key-name"
}

4️⃣ Initialize Terraform

terraform init

5️⃣ Plan the Deployment

terraform plan

6️⃣ Apply the Terraform Configuration

terraform apply -auto-approve

🔍 How to Verify the Setup

Check ALB URL

Once deployed, Terraform outputs the ALB DNS name. Open it in a browser:

terraform output alb_dns_name

Expected Output:

http://your-alb-dns-name

It should display:

<h1>Hello from Terraform</h1>

Connect to EC2 Instance

To access the private EC2 instance:

Connect using Session Manager (SSM):

aws ssm start-session --target <instance-id>

Alternatively, use a bastion host or VPN.

🗑️ Cleanu
p
To destroy all resources:

terraform destroy -auto-approve

📌 Assumptions
A valid domain in Route 53 is available for SSL certificate validation.
The EC2 instance is running Amazon Linux 2.
The ALB is terminating SSL (self-signed certificate).
The user has IAM permissions to create necessary resources.

📄 Files in this Repo
File	Description
main.tf	Defines all AWS resources.
variables.tf	Stores input variables.
outputs.tf	Defines Terraform outputs.
install_web.sh	Bash script to install Apache and create a test page.
README.md	Documentation on how to deploy this infrastructure.

🚀 Future Improvements

Use ACM (AWS Certificate Manager) for automated SSL validation.
Implement Autoscaling Groups for high availability.
Use Terraform Modules for better reusability.