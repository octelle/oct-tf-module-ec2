resource "aws_iam_instance_profile" "instance_profile" {
  count = var.instance_profile_role == null ? 0 : 1

  name = "${var.name}_instance_profile"
  role = var.instance_profile_role
}
