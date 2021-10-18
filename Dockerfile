# Container image that runs Actions code
FROM kscherba/alpine-rsync:latest
LABEL "com.github.actions.name"="Publish WebApp build content"
LABEL org.opencontainers.image.authors="kirill@scherba.ru"
LABEL org.opencontainers.image.source https://github.com/kirill-scherba/publish-rsync

# Additional docker image applications to run Actions code
# RUN apk add git rsync bash openssh

# Code file
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
