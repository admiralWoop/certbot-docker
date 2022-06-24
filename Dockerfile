FROM admiralwoop/docker-alpine-arm

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache --virtual add certbot fish jq tini

COPY crontab /crontabs/root
COPY renew-all /run/
COPY start.fish /run/

VOLUME /certs

ENTRYPOINT ["tini", "--", "/run/start.fish"]
