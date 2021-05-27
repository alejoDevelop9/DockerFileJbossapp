#!/bin/bash
echo "Starting jboss.."

/home/jboss/jboss-eap-7.2/bin/standalone.sh < /dev/null &  
sleep 10
/home/jboss/jboss-eap-7.2/bin/jboss-cli.sh  <<EOF
connect 
batch 
 module add --name=org.postgresql --resources=/home/jboss/jboss-eap-7.2/modules/postgresql-42.2.9.jar --dependencies=javax.api,javax.transaction.api
 /subsystem=datasources/jdbc-driver=postgres:add(driver-name="postgres",driver-module-name="org.postgresql",driver-class-name=org.postgresql.Driver)

data-source add --jndi-name=java:jboss/datasources/dce_geoloc09 --name=dce_geoloc09 --connection-url=jdbc:postgresql://172.19.71.161:5432/dce_geoloc09 --driver-name=postgres --user-name=usergeoloc --password=Consulta_2020 
run-batch

EOF

