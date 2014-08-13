# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# Need git, but run yum clean all after each yum command to clear cache for this layer
RUN yum install -y git && yum clean all

# get latest git data
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

# usuall runs on 5050
EXPOSE 5050

# CMD can be easily overwritten for troubleshooting
CMD python CouchPotatoServer/CouchPotato.py
