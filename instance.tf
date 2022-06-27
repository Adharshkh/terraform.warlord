resource "aws_security_group" "sg_demo1" {
  name = "sg_demo1"
  description = "Security Group"
  
  tags = {
    name = "sg_demo1"
  }
  // outbound 
  egress {
    from_port = 0
    protocol = "-1" // ALL Protocols
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  // inbound
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform-instance" {
  ami = "ami-0d9858aa3c6322f73"
  instance_type = "t2.micro"
  key_name = "key1"
  security_groups = ["sg_demo1"]

  tags = {
    Name = "terraform-instance"
  }
}


