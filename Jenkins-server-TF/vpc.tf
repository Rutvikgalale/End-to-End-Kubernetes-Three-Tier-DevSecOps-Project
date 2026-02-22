resource "aws_vpc" "myvpc"{
cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet"{
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.1.0/24"
availability_zone = "ap-south-1b"
map_public_ip_on_launch = true
}

resource "aws_route_table" "mytable"{
vpc_id = aws_vpc.myvpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.mytable.id
}

resource "aws_internet_gateway" "igw"{
vpc_id = aws_vpc.myvpc.id
}

resource "aws_security_group" "security_group"{
description = "Allowing Jenkins, Sonarqube, SSH Access"
vpc_id = aws_vpc.myvpc.id
dynamic "ingress" {
for_each = [22, 80, 8081, 9000, 9090]
content {
protocol = "tcp"
from_port = ingress.value
to_port = ingress.value
cidr_blocks = ["0.0.0.0/0"]
}
}
egress {
protocol = "-1"
from_port = 0
to_port = 0
cidr_blocks = ["0.0.0.0/0"]
}
}

