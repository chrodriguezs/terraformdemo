resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  tags = {
      Name = "WebServer"
      Project = "DEMO_Ene20"
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = var.IaaC_Username
    password = var.IaaC_Passphrase
    private_key = file(var.IaaC_PrivateKey)
  }
  
  provisioner "file" {
    source      = "lap.sh"
    destination = "/tmp/lap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "ls /tmp/",
      "chmod +x /tmp/lap.sh",
      "bash -s /tmp/lap.sh"
    ]
  }

}
  output "webserver_public_ip" {
      value = aws_instance.example.public_ip
  }

