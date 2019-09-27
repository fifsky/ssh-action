FROM alpine:latest
RUN apk update && \
  apk add --no-cache ca-certificates \
  openssh-client \
  sshpass \
  bash

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
