FROM alpine

MAINTAINER Leon (lvlie) Vliegenthart

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

EXPOSE 7878

RUN \
 echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
 apk --update add --no-cache \
       ca-certificates \
       bash \
       curl \
       unzip \
       libmediainfo \
       mono \
       tzdata && \
  cd / && \
  apk del --purge && \
  rm -rf \
       /var/cache/apk/* \
       /tmp/*

RUN \
 tag=$(curl -sX GET "https://api.github.com/repos/Radarr/Radarr/releases" | grep tag_name | head -1 | awk -F\" '{print $4}') && \
 curl -L -o radar.tar.gz "https://github.com/Radarr/Radarr/releases/download/${tag}/Radarr.develop.${tag#v}.linux.tar.gz" && \
 tar xzf radar.tar.gz && \
 chmod -R go+r /Radarr/ && \
 rm -f radarr.tar.gz

RUN adduser -S -u 800 radarr

USER radarr

CMD mono /Radarr/Radarr.exe -nobrowser -data=/config/radarr & wait
