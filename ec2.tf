data "aws_ami" "my_ami" {
  #most_recent = true
  name_regex = "^ansible"
  owners     = ["372069088296"]
}

resource "aws_instance" "master-1" {
  ami                         = data.aws_ami.my_ami.id
  key_name                    = "terraform keypair"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ansible_subnet-1.id
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Master_01"
  }
}

resource "aws_instance" "master-2" {
  ami                         = data.aws_ami.my_ami.id
  key_name                    = "terraform keypair"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ansible_subnet-2.id
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Master_02"
  }
}
resource "aws_instance" "master-3" {
  ami                         = data.aws_ami.my_ami.id
  key_name                    = "terraform keypair"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ansible_subnet-1.id
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Master_03"
  }
}

resource "aws_instance" "worker-1" {
  ami                         = data.aws_ami.my_ami.id
  key_name                    = "terraform keypair"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ansible_subnet-1.id
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Worker_01"
  }
}
resource "aws_instance" "worker-2" {
  ami                         = data.aws_ami.my_ami.id
  key_name                    = "terraform keypair"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ansible_subnet-2.id
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Worker_02"
  }
}
resource "aws_instance" "worker-3" {
  ami                         = data.aws_ami.my_ami.id
  key_name                    = "terraform keypair"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ansible_subnet-1.id
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Worker_03"
  }
}
