FROM alpine:latest
RUN apk update && \
  apk add ca-certificates && \
  apk add openssh-client && \
  rm -rf /var/cache/apk/*

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
