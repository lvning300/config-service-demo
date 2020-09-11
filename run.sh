#!/bin/sh
echo "********************************************************"
echo "Starting the Eureka Server"
echo "********************************************************"
java  $JAVA_OPTS -Dspring.profiles.active=$profile  -jar /usr/local/config-service-demo-1.0.jar
