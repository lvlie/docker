# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# Need git, but run yum clean all after each yum command to clear cache for this layer
RUN yum install -y git && yum clean all

# Need some extra python stuff
RUN yum install -y python-cheetah.x86_64 && yum clean all

# get latest git data
RUN git clone git://github.com/midgetspy/Sick-Beard.git sickbeard

# add user for media
RUN useradd -u 800 media

# switch to user media
USER media

# usuall runs on 8081
EXPOSE 8081

# CMD can be easily overwritten for troubleshooting
CMD cd sickbeard && python SickBeard.py
