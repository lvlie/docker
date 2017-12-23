FROM alpine

MAINTAINER Leon (lvlie) Vliegenthart

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN \
 apk --update add --no-cache \
       bash \
       py2-pip \
       duplicity && \
  cd / && \
  pip install fasteners && \
  apk del --purge && \
  rm -rf \
       /var/cache/apk/* \
       /tmp/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
