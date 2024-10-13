
locals {
  all_subnets     = merge(aws_subnet.public, aws_subnet.private)
  all_cidr_blocks = [for subnet in local.all_subnets : subnet.cidr_block]
}

# resource "aws_instance" "pool" {
#   for_each                    = local.all_subnets
#   ami                         = data.aws_ami.al2023-ami.id
#   instance_type               = var.instance_type
#   subnet_id                   = each.value.id
#   vpc_security_group_ids      = [aws_security_group.common.id]
#   key_name                    = aws_key_pair.kp.key_name
#   user_data_replace_on_change = true
#   user_data = templatefile("${path.module}/userdata.sh", {
#     cidr_blocks = join(" ", local.all_cidr_blocks)
#   })
# }

# resource "aws_instance" "bastion" {
#   ami                    = data.aws_ami.al2023-ami.id
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public["public_a"].id
#   vpc_security_group_ids = [aws_security_group.bastion.id]
#   key_name               = aws_key_pair.kp.key_name
# }
