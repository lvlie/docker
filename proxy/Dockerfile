FROM centos:7

MAINTAINER Leon (lvlie) Vliegenthart

# Install packages 
RUN yum install -y httpd mod_ssl && yum clean all && \
    rm -f /etc/httpd/conf.d/welcome.conf && \
    rm -f /etc/httpd/conf.d/userdir.conf && \
    rm -f /etc/httpd/conf.d/autoindex.conf

# run on httpd
EXPOSE 443

#Add start script
ADD start.sh /start.sh
RUN chmod +x /start.sh

# CMD can be easily overwritten for troubleshooting
CMD ["/start.sh"]
