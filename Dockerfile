FROM debian:buster-slim 
ENV DEBIAN_FRONTEND=noninteractive
#VOLUME ["/var/www"]

COPY etherpad-lite /opt/etherpad-lite/
COPY node-v12.16.3-linux-x64 /opt/node-v12.16.3-linux-x64/
COPY settings.json /opt/etherpad-lite/
RUN apt-get update -y && apt-get upgrade -y \
	#&& apt-get install -y git \
	#sudo \
	; ln -s /opt/node-v12.16.3-linux-x64/bin/npm /usr/bin/npm \
	; ln -s /opt/node-v12.16.3-linux-x64/bin/node /usr/bin/node \
	;  useradd -s /opt/etherpad-lite --shell /bin/sh etherpad \
	; chown -R etherpad:etherpad /opt/etherpad-lite
	#&& echo "%sudo  ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
#RUN  chown -R www-data:www-data /var/www/dokuwiki
EXPOSE 9001
USER etherpad
CMD export NODE_ENV=production ; /opt/etherpad-lite/bin/run.sh | tail -f /dev/null
#CMD sudo /etc/init.d/apache2 start | tail -f /dev/null
