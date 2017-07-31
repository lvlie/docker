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

RUN wget http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz -O NzbDrone.tar.gz && \
  tar xzf NzbDrone.tar.gz && \
  rm NzbDrone.tar.gz

RUN adduser -S -u 800 sonarr

USER sonarr

CMD ["mono", "--no-browser", "-data=/config/sonarr", "&", "wait"]
