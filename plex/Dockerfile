# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# install packages and clean up directly after to not get a bloated container
RUN curl -o /plexmediaserver.rpm https://downloads.plex.tv/plex-media-server/0.9.16.2.1827-df572f6/plexmediaserver-0.9.16.2.1827-df572f6.x86_64.rpm && \
	yum localinstall -y --nogpgcheck /plexmediaserver.rpm && yum clean all && rm -f /plexmediaserver.rpm

# add user for media, start.sh will switch to media user
RUN useradd -u 800 media

# usually runs on 8081
EXPOSE 32400

# There are other ports for discovery, but we use --net=host so no need to expose ports

# add start script
ADD start.sh /start.sh

# make executable
RUN chmod +x /start.sh

# CMD can be easily overwritten for troubleshooting
CMD ["/start.sh"]
