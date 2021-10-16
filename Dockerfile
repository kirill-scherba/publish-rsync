# Container image that runs Actions code
FROM alpine:latest
LABEL "com.github.actions.name"="Deploy WebApp with Rsync"
LABEL maintainer="kirill@scherba.ru"

# Additional docker image applications to run Actions code
RUN apk add git rsync bash openssh

# Code file
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
