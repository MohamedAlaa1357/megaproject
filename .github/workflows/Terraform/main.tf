resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = var.public_key
}


resource "aws_instance" "ansible_host" {
  ami                         = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Prometheus-Grafana-Server"
  }
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
