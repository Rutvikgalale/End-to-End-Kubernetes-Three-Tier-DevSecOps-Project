resource "aws_instance" "myinstance" {
ami = data.aws_ami.ami.image_id
instance_type = "t3.micro"
key_name = var.key-name
subnet_id = aws_subnet.public_subnet.id
vpc_security_group_ids = [aws_security_group.security_group.id]
root_block_device {
volume_size = 8
}
tags = {
Name = "jenkins-server"
}
}
