# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a key pair for SSH access
resource "aws_key_pair" "key_pair" {
  key_name   = "docker" # Replace with a unique name
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create a security group to allow necessary traffic
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP access from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTPS access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0e2c8caa4b6378d8c" # Replace with your desired AMI ID (x86_64 architecture)
  instance_type = "t2.micro" # Compatible with x86_64 architecture
  key_name      = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker

    # Pull and run the Dockerized application
    sudo docker pull aj1naz/django:latest
    sudo docker run -d -p 80:8000 aj1naz/django:latest
  EOF

  tags = {
    Name = "Dockerization"
  }
}

# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  value = aws_instance.web_server.public_ip
}