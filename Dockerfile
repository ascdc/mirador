FROM ubuntu:14.04.5
MAINTAINER ASCDC <ascdc@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get -y dist-upgrade && \
	apt-get -y install vim curl nodejs git && \
	mkdir -p /var/www/mirador && \
	git clone https://github.com/ProjectMirador/mirador.git /var/www/mirador && \
	cd /var/www/mirador && \
	npm install -g grunt-cli && \
	npm install && \
	bower install
	
WORKDIR /var/www/mirador
ENTRYPOINT ["grunt"]