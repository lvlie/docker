FROM alpine

MAINTAINER Leon (lvlie) Vliegenthart

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

EXPOSE 8989

RUN \
 echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
 apk --update add --no-cache \
       ca-certificates \
       bash \
       curl \
       libmediainfo \
       mono \
       tzdata && \
  cd / && \
  apk del --purge && \
  rm -rf \
       /var/cache/apk/* \
       /tmp/*

RUN curl http://download.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz -o NzbDrone.tar.gz && \
  tar xzf NzbDrone.tar.gz && \
  rm NzbDrone.tar.gz

RUN adduser -S -u 800 sonarr

USER sonarr

CMD mono /NzbDrone/NzbDrone.exe --no-browser -data=/config/sonarr & wait
