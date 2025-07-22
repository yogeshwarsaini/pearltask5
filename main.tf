resource "aws_instance" "strapi_ec2" {
  ami           = "ami-0cd582ee8a22cc7be"
  instance_type = "t2.micro"
  key_name      = "yogesh_key"
  user_data     = file("user_data.sh")

  tags = {
    Name = "yogi-Strapi-EC2"
  }

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]
}

resource "aws_security_group" "strapi_sg" {
  name        = "strapi_sg_yogi"  # 👈 Changed name to avoid duplicate error
  description = "Allow HTTP, HTTPS and SSH"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Strapi Port"
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
