import os
#os.system('sudo systemctl stop tomcat')
os.system('sudo service tomcat stop')
#os.system('sudo rm -f /usr/share/tomcat/webapps/LiveSpread-SQL.war')
os.system('sudo rm -f /home/rage/apache-tomcat-8.0.39/webapps/LS5-0.0.1-SNAPSHOT.war')
os.system('sudo rm -f /home/rage/apache-tomcat-8.0.39/webapps/input.properties')
os.system('sudo rm -rf /home/rage/apache-tomcat-8.0.39/webapps/LS5-0.0.1-SNAPSHOT.war')
os.system('sudo cp /home/rage/test/LS5-0.0.1-SNAPSHOT.war /home/rage/apache-tomcat-8.0.39/webapps/')
os.system('sudo cp /home/rage/test/input.properties /home/rage/apache-tomcat-8.0.39/webapps/')
#os.system('sudo systemctl start tomcat')
os.system('sudo service tomcat start')
os.system('sudo rm -rf /home/rage/test/LS5-0.0.1-SNAPSHOT.war')
os.system('sudo rm -rf /home/rage/test/input.properties')