FROM alpine

MAINTAINER Leon (lvlie) Vliegenthart

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

EXPOSE 8989

RUN \
 apk --update add --no-cache \
       ca-certificates \
       bash \
       libmediainfo \
       mono \
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

RUN git clone --depth 1  https://github.com/drzoidberg33/plexpy.git /opt/plexpy

CMD ["/start.sh"]


RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk -U upgrade && \
  apk -U add \
    libmediainfo \
    ca-certificates \
    mono \
    && \
  apk del make gcc g++ && \
  rm -rf /tmp/src && \
  rm -rf /var/cache/apk/*

RUN wget http://download.sonarr.tv/v2/master/mono/NzbDrone.master.2.0.0.3732.mono.tar.gz -O NzbDrone.tgz && \
  tar xzvf NzbDrone.tgz && \
  rm NzbDrone.tgz

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]