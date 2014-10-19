# Add a layer for easy customization of all my centos7 images
FROM centos:centos7

MAINTAINER Leon (lvlie) Vliegenthart

# Almost all my containers will need EPEL
RUN yum install -y http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-1.noarch.rpm && yum clean all

# CMD can be overwritten easily, so this isnt bad for an intermediate image
CMD ["/bin/bash"] 
