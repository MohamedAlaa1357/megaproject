
resource "aws_key_pair" "example" {
  key_name   = "ssh-key"  # Specify the name of your key pair
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCjLhFTCNPZwhyVjX6uso5Es8whpAYxIyfKDo0De/0hXkPJ5oTFb2Zi8XQ6CnYi+gfuh5HHoS9zCykWFWP7W63L70Aonpkv4FSVwnSMTxokNmC2WpUosAqvQ15PJEFpDF/OuKNxgLVWTdCiNeQmkrw6hAsx1tRXPzal9uTUo57MBoq2iTHyiPxJWlRBzRB2sWv/PUdiA4IgRILCrcGPVo3oNiIYSQWapizp+O2gzDJNfPxS2F8rcdQcMu/Ukt14CvU6I/wJHgTNJKrlS2Tpi3ubqoWccfiDR8knQVMiQyFZBqDlyT9OumqIC1qOaM438hPe3/ozgc4+2dpMWCIQSuaKbnG3HCZWLWS6WETR4OTDhga+aQeGXWPm9glqgGx9UrLyScOFGjhSrbaUDSnq7DTeMgkOgOAKkQTxG+28ZLpq59on5loppA4ScMM8hd+Oy4oYolS32gXRlPWjV4TzN01VnB120JKWLafOKn+rco83rdVyz1zkkO0EfZqiARNXXPWgtaqrHm+9U3St9M8MRCip6oo34riIZmJiT31eFOwZ1Qcfw4uyCElN+Xcifvi0vnRS42thJ8Y3m8axjvfSQqvW+x3ponVtjidneDvoKn913YBQbD4sfn3OsOHstDleBrEIIZ5knt60O9B/DPTR//KSgKfHUNGCEpGaA1PB0CYvSQ== mohamed alaa@DESKTOP-MIPIH4L"  # Replace with your actual public key
}

resource "aws_instance" "ansible_host" {
  ami                         = "ami-08d8ac128e0a1b91c"  # Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.example.key_name  # Use the key pair created above
  associate_public_ip_address = true

  tags = {
    Name = "Prometheus-Grafana-Server"
  }
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ansible_host.public_ip
}