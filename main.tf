
# resource "aws_instance" "ec2" {
#   for_each      = { for i, instance in var.instances : i => instance }
#   ami           = each.var.ami
#   instance_type = each.var.instance_type
#   key_name      = each.var.key_name
#   #   security_groups = each.var.security_groups
#   vpc_security_group_ids = each.var.security_groups
#   name                   = each.var.name
#   tags                   = merge(each.value.tags)
# }
# resource "aws_instance" "ec21" {
#   count           = length(var.instances)
#   instance_type   = var.instances[count.index].instance_type
#   ami             = var.instances[count.index].ami
#   key_name        = var.instances[count.index].key_name
#   security_groups = var.instances[count.index].security_groups

#   tags = {
#     Name        = var.instances[count.index].tags["Name"]
#     Environment = var.instances[count.index].tags["Environment"]
#   }
# }

locals {
  serverconfig = [
    for srv in var.configuration : [
      for i in range(1, srv.no_of_instances + 1) : {
        instance_name   = "${srv.application_name}-${i}"
        instance_type   = srv.instance_type
        subnet_id       = srv.subnet_id
        ami             = srv.ami
        security_groups = srv.vpc_security_group_ids
      }
    ]
  ]
}
// We need to Flatten it before using it
locals {
  instances = flatten(local.serverconfig)
}
resource "aws_instance" "web" {
  for_each = { for server in local.instances : server.instance_name => server }

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  vpc_security_group_ids = each.value.security_groups
  user_data              = <<EOF
#!/bin/bash
echo "Copying the SSH Key to the remote server"
echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCz3ROx3NlxjjLz8BCB2zLpqzAREvLT2XkWMkqQb60i9kSg3TZvLiZSO9hTLDf+HXXnhmaSkeztjGcfpceYbpns4s+KycFg36C39A8LbYq59adrSCudK5PzY8PuMh7zrHe64WaKGHUBU0zmhLeBzrpdQglcd/UR0ueGTqZlCQNdUUQHWYAgXkXdHCx0gpjujIz8vF12XGsF6I46VUXw3fQnEfYrYTWSj4Cr7hbT9qe1mkTEL8XDRy5nlSoGJij4+EM3mxdHobCYB3XtdaNC5Qj48eu5x6YLweDw8vtTC4S1PPWf1sks95ENY8BkzXKWMRs3YLM7sMFIKKEk3P4qCh/gLwZ/q4xiur2YwZ1UOgOOAgRBjoyrocbFhgb53Ne+SzIj+B6wDEGwDA8FkspngA38q0ilYTwUpj68oaWPSLtxqqyGQAkjNUhVIR6A9XXuzUo0aBXmQvfXICx7XRDWEHhhn2i78cRllrpmVeL9JKgu5JO4YuU48nxaEWKI5th7LC0= SAI PRATAP@DESKTOP-K0BHALG" >> /home/ubuntu/.ssh/authorized_keys
echo "Changing the hostname to ${each.value.instance_name}"
hostname ${each.value.instance_name}
echo "${each.value.instance_name}" > /etc/hostname
EOF
  subnet_id              = each.value.subnet_id
  tags = {
    Name = "${each.value.instance_name}"
  }
}
