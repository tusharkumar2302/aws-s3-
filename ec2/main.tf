resource "aws_instance" "web" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t3.micro"

  tags = {
    Name = "infrasity-ec2-4"
  }
}