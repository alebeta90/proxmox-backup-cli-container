FROM debian:10-slim

LABEL maintainer="Alejandro Betancor alebeta@gonkar.com"

RUN true \
	&& apt-get update \
	&& apt-get install wget -y \
	&& apt-get clean \
	&& true
RUN wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg
RUN echo "deb http://download.proxmox.com/debian/pbs buster pbstest" > /etc/apt/sources.list.d/pbs-beta.list
RUN true \
	&& apt-get update \
	&& apt-get install proxmox-backup-client -y \
	&& apt-get clean \
	&& true

RUN mkdir /mydata
RUN chmod -R 777 /mydata

VOLUME /mydata

ENTRYPOINT ["proxmox-backup-client"]
CMD ["help"]
