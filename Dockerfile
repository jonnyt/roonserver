FROM debian:stable-slim
LABEL org.opencontainers.image.authors="jonathont@pm.me"

ENV TZ=America/Los_Angeles

RUN apt update \
        && apt -y upgrade \
        && apt -y install --no-install-recommends bash curl bzip2 ffmpeg cifs-utils alsa-utils tzdata libicu-dev \
        && rm -rf /var/lib/apt/lists/*

ENV ROON_SERVER_PKG=RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL=https://download.roonlabs.net/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT=/data
ENV ROON_ID_DIR=/data

COPY install.sh /
RUN chmod +x install.sh

RUN mkdir -p /app /data /music /backup \
        && /install.sh

VOLUME [ "/data", "/music", "/backup" ]

COPY run.sh /
RUN chmod +x run.sh

ENTRYPOINT ["/run.sh"]
