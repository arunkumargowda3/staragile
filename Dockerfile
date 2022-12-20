FROM tomcat:8.0
COPY target/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
EXPOSE 8080
