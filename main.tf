provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "ansible_vpc" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "ansible"
  }
}

resource "aws_subnet" "ansible_subnet-1" {
  vpc_id                  = aws_vpc.ansible_vpc.id
  cidr_block              = "10.100.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "ansible-subnet-1"
  }
}

resource "aws_subnet" "ansible_subnet-2" {
  vpc_id                  = aws_vpc.ansible_vpc.id
  cidr_block              = "10.100.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "ansible-subnet-2"
  }
}

resource "aws_internet_gateway" "ansible-IGW" {
  vpc_id = aws_vpc.ansible_vpc.id
  tags = {
    Name = "ansible-IGW"
  }
}

resource "aws_route_table" "ansible-route" {
  vpc_id = aws_vpc.ansible_vpc.id
  route {
    gateway_id = aws_internet_gateway.ansible-IGW.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "ansible-Public-Table"
  }

}
resource "aws_route_table_association" "route_table_1" {
  route_table_id = aws_route_table.ansible-route.id
  subnet_id      = aws_subnet.ansible_subnet-1.id
}
resource "aws_route_table_association" "route_table_2" {
  route_table_id = aws_route_table.ansible-route.id
  subnet_id      = aws_subnet.ansible_subnet-2.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.ansible_vpc.id

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}
