# IOT-Mosca
#
# VERSION 2.5.2

FROM mhart/alpine-node:4
MAINTAINER Wing Sun <wingsun@163.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app/

COPY ./ /usr/src/app/

RUN apk update && \
    apk add make gcc g++ python git zeromq-dev krb5-dev && \
    npm install --unsafe-perm --production && \
    apk del make gcc g++ python git

    # mosca adduser true_tracker true_890_123_654 --credentials ./credentials.json \
    # --authorize-publish 'PUB/THA/TRACKER/*' --authorize-subscribe 'SUB/THA/TRACKER/*' && \
    # mosca adduser true_watch true_890_123_654 --credentials ./credentials.json \
    # --authorize-publish 'PUB/THA/WATCH/*' --authorize-subscribe 'SUB/THA/WATCH/*' && \
    
EXPOSE 80
EXPOSE 1883

ENTRYPOINT ["/usr/src/app/bin/mosca", "-d", "/db", "--credentials", "/db/credentials.json", "--http-port", "80", "--http-bundle", "-v"]
