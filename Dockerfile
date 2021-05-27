#Base image
FROM daggerok/jboss-eap-7.2 
 
# Maintainer
MAINTAINER "Alejo" "alejo65348@gmail.com"

 
# Create user alejo with password chiapa$2020
RUN /home/jboss/jboss-eap-7.2/bin/add-user.sh alejo chiapa$2020 --silent

ADD postgresql-42.2.9.jar /home/jboss/jboss-eap-7.2/modules/
ADD configuracion.sh /home/jboss/
ADD codepostalservice-0.0.1-SNAPSHOT.war   /home/jboss/jboss-eap-7.2/standalone/deployments/
 
# JBoss ports
EXPOSE 8080 9990 8009 
 
# Run
RUN /home/jboss/configuracion.sh

