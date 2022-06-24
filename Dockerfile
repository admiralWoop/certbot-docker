FROM admiralwoop/docker-alpine-arm

RUN apk --no-cache add --virtual add certbot fish jq tini

COPY crontab /crontabs/root
COPY renew-all /run/
COPY start.fish /run/

VOLUME /certs

ENTRYPOINT ["tini", "--", "/run/start.fish"]
