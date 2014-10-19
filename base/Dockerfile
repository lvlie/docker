# Add a layer for easy customization of all my centos7 images
FROM centos:centos7

MAINTAINER Leon (lvlie) Vliegenthart

# Update the image
RUN yum -y update && yum clean all

# Almost all my containers will need EPEL
RUN yum install -y epel-release && yum clean all

# CMD can be overwritten easily, so this isnt bad for an intermediate image
CMD ["/bin/bash"] 
