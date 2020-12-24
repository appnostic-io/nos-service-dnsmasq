FROM alpine

RUN apk add --no-cache dnsmasq

ADD entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
