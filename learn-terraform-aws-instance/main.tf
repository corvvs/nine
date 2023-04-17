terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {
  region = "ap-northeast-1"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance
resource "aws_instance" "app_server" {
  # ami - ID of the AMI used to launch the instance.
  # ami           = "ami-830c94e3" // 東京でも使える???
  ami           = "ami-079a2a9ac6ed876fc"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}




