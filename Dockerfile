FROM tomcat:8.0.20-jre8
#test1
COPY target/doh-maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
