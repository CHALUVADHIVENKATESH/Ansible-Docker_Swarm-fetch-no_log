resource "local_file" "hosts_cfg" {
  content = templatefile("hosts.tpl",
    {
      server1 = aws_instance.master.public_ip
      server2 = aws_instance.extramasters.0.public_ip
      server3 = aws_instance.extramasters.1.public_ip
      server4 = aws_instance.workernodes.0.public_ip
      server5 = aws_instance.workernodes.1.public_ip
      server6 = aws_instance.workernodes.2.public_ip
      server7 = aws_instance.extramasters.2.public_ip
      server8 = aws_instance.workernodes.3.public_ip
    }
  )
  filename = "/root/terraformsingleinstance/hosts.cfg"
}
