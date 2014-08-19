# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# add tar file contents to /noip
ADD noip-duc-linux.tar.gz /noip

# copy noip
RUN cp /noip/noip-2.1.9-1/binaries/noip2-x86_64 /noip/noip2

# run under other user
RUN useradd -u 800 noip

# chown whole dir
RUN chown -R noip /noip

# su noip
USER noip

# make sure log exists
RUN touch /noip/log

# CMD can be easily overwritten for troubleshooting
# config file must be generated first. start image with bash and run "noip -C -c /config/noip/no-ip2.conf" 
# do this in a shared volume for example :)
CMD /noip/noip2 -c /config/noip/no-ip2.conf && tail -f /noip/log
