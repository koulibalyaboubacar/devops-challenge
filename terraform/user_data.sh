#!/bin/bash
set -ex

# Log all output to /var/log/user-data.log
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Install dependencies
yum update -y
yum install -y docker unzip aws-cli
systemctl enable docker
systemctl start docker

# Authenticate to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 692859908834.dkr.ecr.us-east-1.amazonaws.com

# Pull latest Flask image
docker pull 692859908834.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest

# Run container (replace old one if exists)
docker stop $(docker ps -aq) || true
docker rm $(docker ps -aq) || true
docker run -d -p 80:5000 --restart always 692859908834.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
