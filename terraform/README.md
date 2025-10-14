# DevOps Challenge - Terraform AWS EC2 with Dockerized Nginx

## 🧩 Project Overview
This project uses **Terraform** to automatically provision an AWS EC2 instance, configure security groups, and deploy a **Dockerized Nginx** web server via `user_data.sh`.

**What happens when you run `terraform apply`:**
1. Creates a security group that allows inbound HTTP (port 80) and all outbound traffic
2. Launches an EC2 instance (Amazon Linux 2, `t3.micro`)
3. Runs a startup script (`user_data.sh`) that installs Docker and starts `nginx:latest`
4. Prints the instance **Public IP** and **Public DNS**

---

## 🛠 Project Structure
terraform/
├── main.tf # EC2 instance + security group
├── provider.tf # AWS provider configuration
├── variables.tf # Input variables (project name, instance type, AMI)
├── outputs.tf # Terraform outputs (IP/DNS)
└── user_data.sh # Bash script that installs Docker and runs Nginx
## ⚙️ Prerequisites

- Terraform v1.x installed  
- AWS account with access keys configured using `aws configure`  
- Region: `us-east-1`
## 🚀 How to Deploy

```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
Outputs:
instance_public_ip  = "34.228.32.119"
instance_public_dns = "ec2-34-228-32-119.compute-1.amazonaws.com"
