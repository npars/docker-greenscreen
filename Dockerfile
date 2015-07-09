FROM phusion/baseimage

RUN buildDeps='git'; \
    set -x; \
    apt-get update && \
    apt-get install -y $buildDeps nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    git clone https://github.com/groupon/greenscreen.git /etc/service/greenscreen && \
    apt-get purge -y --auto-remove $buildDeps && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /etc/service/greenscreen
RUN npm install

ADD greenscreen.sh /etc/service/greenscreen/run

EXPOSE 4994
