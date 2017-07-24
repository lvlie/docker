FROM alpine

MAINTAINER Leon (lvlie) Vliegenthart

EXPOSE 8181

RUN \
 apk --update add --no-cache \
       ca-certificates \
       bash \
       su-exec \
       py2-pip \
       git \
       python \
       py-libxml2 \
       py-lxml \
       openssl-dev \
       libffi-dev \
       unrar \
       tzdata && \
  cd / && \
  apk del --purge && \
  rm -rf \
       /var/cache/apk/* \
       /tmp/*

RUN adduser -S -u 800 plexpy

COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /opt/plexpy && chown plexpy /opt/plexpy

USER plexpy

RUN git clone --depth 1  https://github.com/drzoidberg33/plexpy.git /opt/plexpy && \

CMD ["/start.sh"]