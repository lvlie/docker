# ubuntu has a regularly updated repo, so lets use that (but use LTS)
FROM ubuntu:xenial

MAINTAINER Leon (lvlie) Vliegenthart

ENV PYTHONIOENCODING=utf-8

# update package list
RUN apt-get update 

# install software-properties-common for add-apt-repository
RUN apt-get install -y software-properties-common && apt-get clean

# The official .deb does not seem to get updated very much, so we'll use jcfp's version
RUN add-apt-repository ppa:jcfp/ppa
RUN add-apt-repository ppa:jcfp/sab-addons

# we need to enable multiverse for unrar-nonfree version
RUN sed -i 's/universe/universe multiverse/g' /etc/apt/sources.list

# update package list
RUN apt-get update

# install packages
RUN apt-get install -y sabnzbdplus unrar zip python-sabyenc python-cryptography && apt-get clean

# add user for media
RUN useradd -u 800 media

# add the startup script
ADD start.sh /start.sh
RUN chmod +x /start.sh

# switch to user media
USER media

# ususally runs on 8080
EXPOSE 8080

# CMD can be easily overwritten for debugging
CMD ["/start.sh"]
