# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# add repo for owncloud
ADD owncloud.repo /etc/yum.repos.d/owncloud.repo

# create apache user with uid 800 for the data files :)
RUN useradd -u 800 apache

# Install packages (mariadb gets installed but we will not use it because we only run single user)
RUN yum install -y owncloud httpd php && yum clean all

# add autoconfig for statelessness
ADD autoconfig.php /var/www/html/owncloud/config/autoconfig.php
# usuall runs on 80
EXPOSE 80

# CMD can be easily overwritten for troubleshooting
CMD httpd -D FOREGROUND
