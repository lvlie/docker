FROM alpine

MAINTAINER Leon (lvlie) Vliegenthart

RUN adduser -S backup

RUN apk --update add \
  bash \
  rsync \
  openrc \
  openssh && \
  rm -rf /var/cache/apk/*

RUN rc-update add rsyncd boot
RUN sed -i \
    -e 's/^UsePAM yes/#UsePAM yes/g' \
    -e 's/^#UsePAM no/UsePAM no/g' \
    -e 's/^PasswordAuthentication yes/PasswordAuthentication no/g' \
    -e 's/^#UseDNS yes/UseDNS no/g' \
  /etc/ssh/sshd_config && \
  /usr/bin/ssh-keygen -A

# make sure openrc actually starts the service
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

ADD authorized_keys /home/backup/.ssh/

VOLUME /data/backup

EXPOSE 22

# Run sshd in foreground
CMD ["/usr/sbin/sshd", "-D"]
