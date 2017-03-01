FROM tomcat:8.5-jre8
MAINTAINER "roamer <roamerxv@gmail.com>"


#update system timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#update application timezone
RUN echo "Asia/Shanghai" >> /etc/timezone

#ADD ./lib/*.jar /usr/local/tomcat/lib/
#RUN keytool -import -noprompt -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -alias terrier -file /usr/local/tomcat/conf/terrier.cer
#RUN apt-get update && apt-get install vim -y
