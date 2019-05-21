provider "azurerm"
{
}
resource "null_resource" "copywar" {
  provisioner "file" {
        source="/var/jenkins/workspace/CORA_Livespread/target/LS5-0.0.1-SNAPSHOT.war"
        destination ="/home/rage/test/LS5-0.0.1-SNAPSHOT.war"
        connection {
            type="ssh"
            host="10.173.14.4"
            port="22"
            user="${var.user}"
            password="${var.password}"
        }
    }}
resource "null_resource" "copyinputproperties" {
  provisioner "file" {
        source="/var/jenkins/workspace/CORA_Livespread/src/main/resources/input.properties"
        destination ="/home/rage/test/input.properties"
        connection {
            type="ssh"
            host="10.173.14.4"
            port="22"
            user="${var.user}"
            password="${var.password}"
        }
    }}	
resource "null_resource" "copyscript" {
  provisioner "file" {
        source="/var/jenkins/workspace/CORA_Livespread/execute.py"
        destination="/home/rage/test/execute.py"
        connection {
            type="ssh"
            host="10.173.14.4"
            port="22"
            user="${var.user}"
            password="${var.password}"
        }
    }}
resource "null_resource" "remoteexecution" {
  depends_on = ["null_resource.copywar"]
  depends_on = ["null_resource.copyscript"]
  depends_on = ["null_resource.copyinputproperties"]
#  depends_on = ["module.copy.null_resource.CopyScript"]
  provisioner "remote-exec" {
        inline = [
          "python /home/rage/test/execute.py",
        ]
        connection {
            type="ssh"
            host="10.173.14.4"
            port="22"
            user="${var.user}"
            password="${var.password}"
        }
}}