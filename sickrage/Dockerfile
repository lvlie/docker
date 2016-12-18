FROM centos:7

MAINTAINER Leon (lvlie) Vliegenthart

# Need git, but run yum clean all after each yum command to clear cache for this layer
RUN yum install -y git && yum clean all

# Need some extra python stuff
RUN yum install -y python-cheetah.x86_64 && yum clean all

# get latest git data
RUN git clone https://github.com/SickRage/SickRage.git sickrage

# add user for media
RUN useradd -u 800 media

# usuall runs on 8081
EXPOSE 8081

# add start script
ADD start.sh /start.sh

# make executable
RUN chmod +x /start.sh

# chown /sickrage
RUN chown -R media:media /sickrage

# switch to user media
USER media

# CMD can be easily overwritten for troubleshooting
CMD ["/start.sh"]
