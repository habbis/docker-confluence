FROM debian:buster-slim 
ENV DEBIAN_FRONTEND=noninteractive
VOLUME ["/opt/confluence"]
VOLUME ["/var/confluence"]

COPY atlassian-confluence-* opt/confluence/
#RUN ln -s  /opt/confluence/atlassian-confluence-* /opt/confluence/current
COPY mysql-connector-java-* /opt/confluence/current/confluence/WEB-INF/lib/
COPY confluence  /etc/init.d/
RUN apt-get update -y && apt-get upgrade -y \
	; apt-get install -y openjdk-11-jdk-headless fontconfig \
	#;  useradd -s /opt/confluence/ --shell /bin/sh root \
	; chown -R root:root /opt/confluence \
	; chown -R root:root /var/confluence 
EXPOSE 8090
#USER root
CMD /etc/init.d/confluence start | tail -f /dev/null
#CMD sudo /etc/init.d/apache2 start | tail -f /dev/null
