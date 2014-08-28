# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# install packages and clean up directly after to not get a bloated container
RUN curl -o /plexmediaserver.rpm http://downloads.plexapp.com/plex-media-server/0.9.9.16.555-50cd0c3/plexmediaserver-0.9.9.16.555-50cd0c3.x86_64.rpm && \
	yum localinstall -y --nogpgcheck /plexmediaserver.rpm && yum clean all && rm -f /plexmediaserver.rpm

# add user for media, start.sh will switch to media user
RUN useradd -u 800 media

# usually runs on 8081
EXPOSE 32400

# need some other ports for network discovery
EXPOSE 32410
EXPOSE 32412
EXPOSE 32413
EXPOSE 32414

# add start script
ADD start.sh /start.sh

# make executable
RUN chmod +x /start.sh

# CMD can be easily overwritten for troubleshooting
CMD ["/start.sh"]
