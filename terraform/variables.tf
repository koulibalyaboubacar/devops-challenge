variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "devops-challenge"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2 (us-east-1)"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}
