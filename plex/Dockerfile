# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# add plex repo
ADD plex.repo /etc/yum.repos.d/plex.repo

# install packages
RUN yum install -y --nogpgcheck plexmediaserver && yum clean all

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
