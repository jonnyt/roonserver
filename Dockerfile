FROM debian:12-slim
LABEL org.opencontainers.image.authors="jonathont@gmail.com"

ENV TZ_DATA=Los_Angeles

RUN apt update \
        && apt -y upgrade \
        && apt -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils libicu72

ENV ROON_SERVER_PKG=RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL=https://download.roonlabs.net/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT=/data
ENV ROON_ID_DIR=/data

VOLUME [ "/app", "/data", "/music", "/backup" ]

ADD run.sh /
RUN chmod +x run.sh

ENTRYPOINT ["/bin/sh","-c","/run.sh"]
