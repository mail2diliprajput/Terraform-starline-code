resource "aws_security_group" "web_server_sg" {
 name        = "var.security_group"
 description = "Allow HTTPS to web server"
 vpc_id      = aws_vpc.my_vpc.id

 tags = {
   Name = " "
 }
}

resource "aws_security_group_rule" "allow_https_inbound_port" {
 type              = "ingress"
 description       = "HTTPS ingress"
 from_port         = 443
 to_port           = 443
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.web_server_sg.id
}

resource "aws_security_group_rule" "allow_all" {
 type              = "ingress"
 description       = "allow all"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.web_server_sg.id
}