FROM centos:7

MAINTAINER Leon (lvlie) Vliegenthart

EXPOSE 8989

RUN yum install curl libmediainfo

RUN curl -L http://download.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz -o NzbDrone.tar.gz && \
  tar xzf NzbDrone.tar.gz && \
  rm NzbDrone.tar.gz

RUN useradd -u 800 sonarr

USER sonarr

CMD mono /NzbDrone/NzbDrone.exe --no-browser -data=/config/sonarr & wait
