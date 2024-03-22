data "aws_ami" "ubuntu" {
    most_recent = true
    
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

resource "aws_instance" "web"{
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    tags = {
        Name = "Hi"
         }
} 

