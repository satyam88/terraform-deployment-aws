
data "aws_ami" "amazon-linux-3" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["137112412989"] # Official Amazon Linux AMI owner ID
}
resource "aws_instance" "dev-instance" {
  ami           = data.aws_ami.amazon-linux-3.id
  instance_type = var.instance_size
  count         = var.instance_count
  key_name      = var.instance_key

  tags = {
    Name        = "My Network"
    Environment = "Dev"
  }
}

resource "aws_vpc" "myvpc00101" {
  cidr_block = "10.0.0.0/16"
}

