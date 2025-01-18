FROM tomcat:latest
MAINTAINER raju
COPY ./webapp/target/*.war /usr/local/tomcat/webapps
