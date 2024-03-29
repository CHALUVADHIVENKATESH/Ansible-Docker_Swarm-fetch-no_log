resource "aws_instance" "master" {
  ami                         = "ami-04505e74c0741db8d"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "LaptopKey"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Docker-Master-01"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
        #!/bin/bash
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuqdAweCKfjItppjtjWsOzcO6fOLPGY9FGkL8205JcjkXs7q6YXsrDEkhnKEx+f0F1kOdNmpc0VBHKFWpWdFCaF0KmuW7vt1/VfW2uOYSzkNZOTbi4lkHqJpAr/PP1FoirlQ7hNtz9fZLLPe+a/iso76YC5rsTpWGOHtQePcDRnTaV1QdpfaRFODBqgV+u/HBHtafOiWDeNs6PeboUMQ0J3hWQunCWQvD6Icm1vYKEzjP9JuvZuuUN5xOLBFzhsvrvuvkqN2okVFrGdTcRTq13KgOR+mnhYPCNPadBodGbMMCVpdyzq3kveaMtDiStcVzrFxAe96JDonOz9Z3T++UEY1YeFoEq6F7r/PMzmaMVckQPaS0aJsdpZFhXDpcTwxWYazBf1HdG2NGmyU7LtLaA0NVzTqCH0oruAdM+f2XAcMlrH3BAqbOeltL/y2o8QKzgqHzDeWNlE6s9Zt5eT26bkG48+Fipn2o59QX3Ky5HD3EKTctAVes/ABTYdIhgRtc= root@ip-10-40-1-31' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}

resource "aws_instance" "workernodes" {
  count                       = 4
  ami                         = "ami-04505e74c0741db8d"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "LaptopKey"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Docker-Worker-0${count.index + 1}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
        #!/bin/bash
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuqdAweCKfjItppjtjWsOzcO6fOLPGY9FGkL8205JcjkXs7q6YXsrDEkhnKEx+f0F1kOdNmpc0VBHKFWpWdFCaF0KmuW7vt1/VfW2uOYSzkNZOTbi4lkHqJpAr/PP1FoirlQ7hNtz9fZLLPe+a/iso76YC5rsTpWGOHtQePcDRnTaV1QdpfaRFODBqgV+u/HBHtafOiWDeNs6PeboUMQ0J3hWQunCWQvD6Icm1vYKEzjP9JuvZuuUN5xOLBFzhsvrvuvkqN2okVFrGdTcRTq13KgOR+mnhYPCNPadBodGbMMCVpdyzq3kveaMtDiStcVzrFxAe96JDonOz9Z3T++UEY1YeFoEq6F7r/PMzmaMVckQPaS0aJsdpZFhXDpcTwxWYazBf1HdG2NGmyU7LtLaA0NVzTqCH0oruAdM+f2XAcMlrH3BAqbOeltL/y2o8QKzgqHzDeWNlE6s9Zt5eT26bkG48+Fipn2o59QX3Ky5HD3EKTctAVes/ABTYdIhgRtc= root@ip-10-40-1-31' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}

resource "aws_instance" "extramasters" {
  count                       = 3
  ami                         = "ami-04505e74c0741db8d"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "LaptopKey"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Docker-Master-0${count.index + 2}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
        #!/bin/bash
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuqdAweCKfjItppjtjWsOzcO6fOLPGY9FGkL8205JcjkXs7q6YXsrDEkhnKEx+f0F1kOdNmpc0VBHKFWpWdFCaF0KmuW7vt1/VfW2uOYSzkNZOTbi4lkHqJpAr/PP1FoirlQ7hNtz9fZLLPe+a/iso76YC5rsTpWGOHtQePcDRnTaV1QdpfaRFODBqgV+u/HBHtafOiWDeNs6PeboUMQ0J3hWQunCWQvD6Icm1vYKEzjP9JuvZuuUN5xOLBFzhsvrvuvkqN2okVFrGdTcRTq13KgOR+mnhYPCNPadBodGbMMCVpdyzq3kveaMtDiStcVzrFxAe96JDonOz9Z3T++UEY1YeFoEq6F7r/PMzmaMVckQPaS0aJsdpZFhXDpcTwxWYazBf1HdG2NGmyU7LtLaA0NVzTqCH0oruAdM+f2XAcMlrH3BAqbOeltL/y2o8QKzgqHzDeWNlE6s9Zt5eT26bkG48+Fipn2o59QX3Ky5HD3EKTctAVes/ABTYdIhgRtc= root@ip-10-40-1-31' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}
