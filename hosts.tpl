[docker_servers]
server1 ansible_host=${server1}      ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server2 ansible_host=${server2}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server3 ansible_host=${server3}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server4 ansible_host=${server4}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server5 ansible_host=${server5}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server6 ansible_host=${server6}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server7 ansible_host=${server7}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server8 ansible_host=${server8}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22

[docker_master]
server1 ansible_host=${server1}      ansible_connection=ssh ansible_user=ubuntu ansible_port=22

[docker_managers]
server2 ansible_host=${server2}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server3 ansible_host=${server3}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server7 ansible_host=${server7}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22

[docker_workers]
server4 ansible_host=${server4}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server5 ansible_host=${server5}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server6 ansible_host=${server6}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server8 ansible_host=${server8}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22
