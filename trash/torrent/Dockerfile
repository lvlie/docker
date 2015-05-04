# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# Install packages 
RUN yum install -y wget httpd rtorrent tar screen

# add user for media
RUN useradd -u 800 torrent

# install rutorrent
RUN wget http://dl.bintray.com/novik65/generic/rutorrent-3.6.tar.gz && tar xf rutorrent-3.6.tar.gz -C /var/www/html/ && rm rutorrent*.gz
RUN wget http://dl.bintray.com/novik65/generic/plugins-3.6.tar.gz && tar xf plugins-3.6.tar.gz -C /var/www/html/rutorrent/ && rm plugins*.gz
RUN chown -R apache:apache /var/www/html

# usuall runs on 80
EXPOSE 80

# add rc file
ADD rtorrent.rc /home/torrent/.rtorrent.rc
RUN chmod 775 /home/torrent/.rtorrent.rc
RUN chown torrent /home/torrent/.rtorrent.rc

USER torrent

WORKDIR /home/torrent
# CMD can be easily overwritten for troubleshooting
CMD bash
