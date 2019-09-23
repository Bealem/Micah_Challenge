provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.instance.id]

user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 80 &
              EOF

  tags = {
    Name = "terraform-example"
  }
}


resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}


resource "aws_security_group" "instance" {
 

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




output "ip" {
  value = aws_eip.ip.public_ip
}
output "ami" {
  value = aws_instance.example.ami
}


