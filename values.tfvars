# instances = [
#   {
#     instance_type   = "t2.micro"
#     ami             = "ami-03d0df1819da2380e"
#     key_name        = "sai_key"
#     security_groups = ["sg-0644cb54f2c402b32"]
#     tags = {
#       Name        = "Flask-Image/one"
#       Environment = "Develop"
#     }
#   },
#   {
#     instance_type   = "t2.micro"
#     ami             = "ami-0cc9838aa7ab1dce7"
#     key_name        = "sai_key"
#     security_groups = ["sg-0ca36c346100059ab"]
#     tags = {
#       Name        = "ec2-image/two"
#       Environment = "Stage"
#     }
#   },
#   {
#     instance_type   = "t2.micro"
#     ami             = "ami-03d0df1819da2380e"
#     key_name        = "sai_key"
#     security_groups = ["sg-0644cb54f2c402b32"]
#     tags = {
#       Name        = "flask-image/three"
#       Environment = "Preprod"
#     }
#   },
#   {
#     instance_type   = "t2.micro"
#     ami             = "ami-0f58b397bc5c1f2e8"
#     key_name        = "sai_key"
#     security_groups = ["sg-0ca36c346100059ab"]
#     tags = {
#       Name        = "Ubuntu-image/Four"
#       Environment = "Prod"
#     }
#   }
# ]
configuration = [
  {
    "application_name" : "sai-dev",
    "ami" : "ami-0f58b397bc5c1f2e8",
    "no_of_instances" : "2",
    "instance_type" : "t2.micro",
    "subnet_id" : "subnet-0b11175b22de6fa9a",
    "vpc_security_group_ids" : ["sg-0644cb54f2c402b32", "sg-0ca36c346100059ab"]
  },
  {
    "application_name" : "master-dev",
    "ami" : "ami-0f58b397bc5c1f2e8",
    "instance_type" : "t2.micro",
    "no_of_instances" : "1"
    "subnet_id" : "subnet-0b11175b22de6fa9a"
    "vpc_security_group_ids" : ["sg-0644cb54f2c402b32"]
  },
  {
    "application_name" : "krishna-dev",
    "ami" : "ami-0f58b397bc5c1f2e8",
    "instance_type" : "t2.micro",
    "no_of_instances" : "3"
    "subnet_id" : "subnet-0b11175b22de6fa9a"
    "vpc_security_group_ids" : ["sg-0644cb54f2c402b32"]
  }

]
