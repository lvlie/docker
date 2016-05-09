# lets use my default centos7 base image
FROM lvlie/base

MAINTAINER Leon (lvlie) Vliegenthart

# Install packages 
RUN yum install -y httpd mod_ssl && yum clean all || true # workaround docker hub problem
RUN yum install -y httpd mod_ssl && yum clean all  # with any luck, the failing package is now already installed

# run on httpd
EXPOSE 443

#Add start script
ADD start.sh /start.sh
RUN chmod +x /start.sh

# CMD can be easily overwritten for troubleshooting
CMD ["/start.sh"]
