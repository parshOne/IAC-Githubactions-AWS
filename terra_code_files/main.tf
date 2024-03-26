data "local_file" "private_key"{
    filename = "terra_code_files/privatekey.pem"
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
    private_key = data.local.file.private_key.content
    host = self.public_ip
    
 }
} 

