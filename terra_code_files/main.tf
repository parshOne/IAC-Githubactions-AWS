data "local_file" "private_key"{
    filename = "privatekey.pem"
}

resource "aws_instance" "web"{
    ami = "ami-05295b6e6c790593e"
    instance_type = var.instance_type
    tags = {
        Name = "Hi"
         }

provisioner "remote-exec" {
    inline = [ 
        "sudo yum update -y",
        "sudo yum install -y ansible",
        "ansible-playbook -i localhost, -c local orch_tion.yml"
        ]
}

connection {
    type  = "ssh"
    user  = "ec2-user"
    private_key = data.local_file.private_key.content
    host = self.public_ip
    
}
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH traffic from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


