# resource "null_resource" "git_clone" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
    
#     command =  "git clone  https://github.com/techiescamp/kubeadm-scripts /tmp/git-dir"
    
#   }
# }

# resource "null_resource" "copy_script" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     command = <<-EOT
#       cp /tmp/kubeadm-scripts/scripts/master.sh /tmp/
#     EOT
#   }
# }

# resource "null_resource" "execute_script" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     command = <<-EOT
#       cd /tmp/
#       chmod +x master.sh
#       ./master.sh
#     EOT
#   }
# }


