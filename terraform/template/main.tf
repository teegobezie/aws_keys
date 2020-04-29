
resource "tls_private_key" "private" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "public" {
  key_name   = "${var.team_name}"
  public_key = "${tls_private_key.private.public_key_openssh}"
}


resource "local_file" "private" {
  content = "${tls_private_key.private.private_key_pem}"
  filename = "../teams_keys/${var.team_name}.pem"
}

resource "local_file" "public" {
  content = "${aws_key_pair.public.public_key}"
  filename = "../teams_keys/${var.team_name}.pub"
}