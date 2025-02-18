# AWS Configuration
region = "us-east-1"

# EC2 Configuration
ami_id        = "ami-053a45fff0a704a47"
ssh_key       = "take-home-key-pair"
instance_type = "t2.micro"

# Networking
ssh_allowed_ip = ["70.95.33.243/32"]

# ALB Configuration
alb_name = "takehome-alb"

# Environment Tag
tag_environment = "dev"

root_domain = "global-tek-pros.com"

