resource "aws_instance" "web"{
    ami = "ami-05295b6e6c790593e"
    instance_type = var.instance_type
    tags = {
        Name = "Hi"
         }
} 

