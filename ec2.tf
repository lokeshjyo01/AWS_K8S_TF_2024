resource "aws_instance" "kubeadm_master" {
  ami                          = var.ami_id
  instance_type                = var.instance_type
  subnet_id                    = aws_subnet.SWARM-VPC-Pub-subnet.id
  vpc_security_group_ids       = [aws_security_group.SWARM-VPC-SG.id] 
  associate_public_ip_address  = true
  availability_zone            = var.az_zone
  key_name                     = "k8snov23"
  user_data                    = file("common.sh")

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("k8snov23.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo git clone https://github.com/smobinulla/kuberepos.git /tmp/scripts",
      "sudo chmod +x /tmp/scripts/master.sh",
      #"sleep 2m",
      #"sudo /tmp/scripts/master.sh" # Execute your script
    ]
  }

  tags = {
    Name     = "kubeadm_master"
    Owner    = "lokeshkumar"
    customer = "lokeshkumar"
  }
}

resource "aws_instance" "kubeadm_node1" {
  ami = var.ami_id
  count = 2
  instance_type = var.instance_type1
  subnet_id      = aws_subnet.SWARM-VPC-Pub-subnet.id
  #vpc_security_group_ids = [aws_security_group.SWARM-VPC-SG.id]
  vpc_security_group_ids = [aws_security_group.worker-nodes-sg.id]
  associate_public_ip_address = true
  availability_zone = var.az_zone
  key_name = "k8snov23"
  user_data = file("common.sh")

  #tags = {
   # Name = "kubeadm_node1"
    #Owner = "Mobin"
    #customer = "Mobin"
  #}
tags = {
    "Name"  = "Node${count.index + 1}"
    "Value" = "Value${count.index + 1}"
  }
  
}

### Outputs of Docker swarm and docker-nodes public Ips
output "kubeadm_master" {
  value = "${aws_instance.kubeadm_master.*.public_ip}"
}

output "kubeadm_node1" {
  value = "${aws_instance.kubeadm_node1.*.public_ip}"
}