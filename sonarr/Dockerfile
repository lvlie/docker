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
 apk del --purge && \
 rm -rf \
       /var/cache/apk/* \
       /tmp/*

RUN curl -L http://download.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz -o NzbDrone.tar.gz && \
  tar xzf NzbDrone.tar.gz && \
  rm NzbDrone.tar.gz

ENV MEDIAINFO_VERSION='0.7.97'

RUN \
 apk --update add --no-cache \
    make \
    g++ gcc git \
    sqlite sqlite-libs \
    xz \
    unrar \
    zlib zlib-dev && \
 curl -L "https://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VERSION}/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" \
        -o "/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" && \
 curl -L "https://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VERSION}/MediaInfo_DLL_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" \
        -o "/MediaInfo_DLL_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" && \
 tar xpf "/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" && \
 tar xpf "/MediaInfo_DLL_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" && \
 cd /MediaInfo_CLI_GNU_FromSource && \
 ./CLI_Compile.sh && \
 cd /MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/ && \
 make install && \
 cd /MediaInfo_DLL_GNU_FromSource && \
 ./SO_Compile.sh && \
 cd /MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library && \
 make install && \
 cd /MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library && \
 make install && \
 apk del --purge \
    make \
    g++ gcc git sqlite && \
 rm -rf "/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" && \
 rm -rf "/MediaInfo_DLL_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" && \
 rm -rf /MediaInfo_CLI_GNU_FromSource && \
 rm -rf /MediaInfo_DLL_GNU_FromSource && \
 rm -rf \
       /var/cache/apk/* \
       /tmp/*


RUN adduser -S -u 800 sonarr

USER sonarr

CMD mono /NzbDrone/NzbDrone.exe --no-browser -data=/config/sonarr & wait
