#!/bin/bash
set -xe

# Log all output
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Install and start Docker
yum update -y
yum install -y docker
systemctl enable docker
systemctl start docker

# Pull and run Flask app from Docker Hub
docker pull aboubacar2406/devops-flask:latest
docker run -d -p 80:5000 --restart always aboubacar2406/devops-flask:latest
