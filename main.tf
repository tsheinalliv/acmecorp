terraform {
  cloud {
    organization = "acmecorp001"

    workspaces {
      name = "acmecorp"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "rhel_workstation1" {
  ami                    = "ami-0b0af3577fe5e3532"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0aaa66094b0466be3"]
  subnet_id              = "subnet-0ecce36e190cf412d"

  tags = {
    Name = "adminworkstation"
  }
}


