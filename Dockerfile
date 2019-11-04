FROM tomcat:8.5
MAINTAINER Emanoel Venancio Justino

RUN apt-get update && \ 
apt-get install -y openjdk:11 && \
apt-get install -y ant && \
apt-get clean;

RUN apt-get update && \ 
apt-get install ca-certificates-java && \
apt-get clean && \
update-ca-certificates -f;

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME

RUN echo "export JAVA_OPTS=\"-Dapp.env=staging\"" > /usr/local/tomcat/bin/setenv.sh
COPY pkg/demo.war /usr/local/tomcat/webapps/demo.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
