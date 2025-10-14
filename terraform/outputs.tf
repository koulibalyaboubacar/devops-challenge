output "instance_public_ip" {
  value = aws_instance.app.public_ip
}

output "instance_public_dns" {
  value = aws_instance.app.public_dns
}
output "alb_dns_name" {
  value       = aws_lb.app_alb.dns_name
  description = "Public DNS name of the Application Load Balancer"
}
