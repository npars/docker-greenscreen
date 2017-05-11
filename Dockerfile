FROM phusion/baseimage

RUN apt-get update && \
    apt-get install -y nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    rm -rf /var/lib/apt/lists/*

ARG GREENSCREEN_GITSHA=8f33a6e92615e061179e17afd3e2a78703ac2969
ARG GREENSCREEN_DOWNLOAD_SHA1=be27e920a812e5a5af128b1befa58cd3dd2aca3c
ARG GREENSCREEN_DOWNLOAD_URL=https://github.com/npars/greenscreen/archive/${GREENSCREEN_GITSHA}.zip

RUN set -x; buildDeps='curl ca-certificates unzip'; \
    apt-get update && \
    apt-get install -y $buildDeps && \
    curl -sSL "$GREENSCREEN_DOWNLOAD_URL" -o greenscreen.zip && \
    echo "$GREENSCREEN_DOWNLOAD_SHA1 *greenscreen.zip" | sha1sum -c - && \
    unzip greenscreen.zip && \
    mv greenscreen-${GREENSCREEN_GITSHA} /srv/greenscreen && \
    rm greenscreen.zip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv/greenscreen
RUN npm install

ADD greenscreen.sh /etc/service/greenscreen/run

EXPOSE 4994
