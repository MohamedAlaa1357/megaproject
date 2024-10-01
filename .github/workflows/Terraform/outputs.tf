output "instance_ip" {
  description = "The public IP of the Ansible-managed EC2 instance"
  value       = aws_instance.ansible_host.public_ip
}