FROM centos:7

MAINTAINER Leon (lvlie) Vliegenthart

EXPOSE 7878

RUN yum install -y epel-release && \
    yum install -y libmediainfo mono-core mono-locale-extras && \
    yum clean all

RUN \
 tag=$(curl -sX GET "https://api.github.com/repos/Radarr/Radarr/releases" | grep tag_name | head -1 | awk -F\" '{print $4}') && \
 curl -L -o radar.tar.gz "https://github.com/Radarr/Radarr/releases/download/${tag}/Radarr.develop.${tag#v}.linux.tar.gz" && \
 tar xzf radar.tar.gz && \
 chmod -R go+r /Radarr/ && \
 rm -f radarr.tar.gz

RUN useradd -u 800 radarr

USER radarr

CMD mono /Radarr/Radarr.exe -nobrowser -data=/config/radarr & wait
