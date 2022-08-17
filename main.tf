provider "aws" {
  shared_config_files      =["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "customprofile"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0729e439b6769d6ab"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["0d79dae8ebfdeb450"]
  subnet_id              = "0cb86d5e4451b227d"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



