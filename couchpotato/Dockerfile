FROM centos:7

MAINTAINER Leon (lvlie) Vliegenthart

# Need git, but run yum clean all after each yum command to clear cache for this layer
RUN yum install -y git && yum clean all

# get latest git data
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

# add user for media
RUN useradd -u 800 media

# add start.sh
ADD start.sh /start.sh

# make executable
RUN chmod +x /start.sh

# chown the git clone
RUN chown -R media:media /CouchPotatoServer

# usuall runs on 5050
EXPOSE 5050

# switch to user media
USER media

# CMD can be easily overwritten for troubleshooting
CMD ["/start.sh"]
