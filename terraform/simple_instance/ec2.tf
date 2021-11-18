provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "ac1418e6729f7762a63516b02c279e8a52c63147"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-11 14:21:21"
    git_last_modified_by = "39169795+GBaileyMcEwan@users.noreply.github.com"
    git_modifiers        = "39169795+GBaileyMcEwan"
    git_org              = "GBaileyMcEwan"
    git_repo             = "terragoat"
    yor_trace            = "4ef9a5f8-6356-4ab0-8fc5-661ff5489883"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "65a69aaf1d02bd98fdfa3aa07f9d894528592680"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-18 07:22:19"
    git_last_modified_by = "39169795+GBaileyMcEwan@users.noreply.github.com"
    git_modifiers        = "39169795+GBaileyMcEwan"
    git_org              = "GBaileyMcEwan"
    git_repo             = "terragoat"
    yor_trace            = "c1463827-dc1f-44da-a4d7-a0bf42e3242c"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
