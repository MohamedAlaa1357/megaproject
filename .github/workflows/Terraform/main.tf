


resource "aws_instance" "ansible_host" {
  ami                         = "ami-08d8ac128e0a1b91c"  # Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  key_name                    = "deployer-key"
  associate_public_ip_address = true

  tags = {
    Name = "Prometheus-Grafana-Server"
  }
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ansible_host.public_ip
}
