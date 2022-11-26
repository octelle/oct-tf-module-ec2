module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name                 = var.name
  ami                  = var.ami
  instance_type        = var.instance_type
  create_spot_instance = var.is_spot_instance

  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id

  monitoring    = true
  #ebs_optimized = true

  root_block_device = [merge(
    var.root_block_device,
    {
      encrypted = true,
    }
  )]

  metadata_options = {
    http_tokens = "required",
  }

  #iam_instance_profile = var.instance_profile_role == null ? null : aws_iam_instance_profile.instance_profile[0].name
  iam_instance_profile = aws_iam_role.instance_role.name

  user_data = var.user_data
  tags      = var.tags
}

resource "aws_eip" "this" {
  count    = var.associate_eip ? 1 : 0
  instance = module.ec2_instance.id
  vpc      = true
}
