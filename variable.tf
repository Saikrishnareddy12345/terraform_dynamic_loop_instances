# variable "instances" {
#   description = "using dynamic loop"
#   type = list(object({
#     instance_type   = String
#     name            = String
#     ami             = String
#     key_name        = String
#     security_groups = String
#     tags            = map(String)
#   }))
#   default = [{
#     instance_type   = t2_micro
#     name            = one
#     ami             = ami-03d0df1819da2380e
#     key_name        = sai_key
#     security_groups = sg-0644cb54f2c402b32
#     tags = {
#       Name        = "Flask-Image/one"
#       Environment = "Develop"
#     }
#     },
#     {
#       instance_type   = t2_micro
#       name            = two
#       ami             = ami-0cc9838aa7ab1dce7
#       key_name        = sai_key
#       security_groups = sg-0ca36c346100059ab
#       tags = {
#         Name        = "ec2-image/two"
#         Environment = "Stage"
#       }
#     },
#     {
#       instance_type   = t2_micro
#       name            = three
#       ami             = ami-03d0df1819da2380e
#       key_name        = sai_key
#       security_groups = sg-0644cb54f2c402b32
#       tags = {
#         Name        = "flask-image/three"
#         Environment = "Preprod"
#       }
#     },
#     {
#       instance_type   = t2_micro
#       name            = Four
#       ami             = ami-0f58b397bc5c1f2e8
#       key_name        = sai_key
#       security_groups = sg-0ca36c346100059ab
#       tags = {
#         Name        = "Ubuntu-image/Four"
#         Environment = "Prod"
#       }
#     }

#   ]
# }
# variable "instances" {
#   description = "list of the instance values"
#   type = list(object({
#     instance_type = string
#     # name            = string
#     ami             = string
#     key_name        = string
#     security_groups = list(string)
#     tags            = map(string)
#   }))
# }
variable "configuration" {
  description = "The total configuration, List of Objects/Dictionary"
  default     = [{}]
}
