resource "aws_instance" "vpn" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  key_name        = "amazon"
  security_groups = ["default", "launch-wizard-1"]
  tags = {
    Name = "OpenVPN"
  }
}

