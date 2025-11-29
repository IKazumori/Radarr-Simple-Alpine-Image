ARG ALPINE_TAG=3.22

FROM alpine:${ALPINE_TAG}

ARG ARCH=x64
ARG RADARR_BRANCH=develop
ARG RADARR_VERSION

RUN apk add --update --no-cache ca-certificates icu-libs libstdc++ sqlite-libs

RUN mkdir -p /app/ \
 && wget -O - "https://radarr.servarr.com/v1/update/${RADARR_BRANCH}/updatefile?version=${RADARR_VERSION}&os=linuxmusl&runtime=netcore&arch=${ARCH}" | tar xzf - -C /app/ --strip-components=1 --exclude="*/Radarr.Update"

LABEL org.opencontainers.image.title="Radarr"
LABEL org.opencontainers.image.description="Lightweight Radarr"
LABEL org.opencontainers.image.authors="Kazumori"
LABEL org.opencontainers.image.source="https://github.com/IKazumori/Radarr-Simple-Alpine-Image"
LABEL org.opencontainers.image.version=${RADARR_VERSION}

EXPOSE 7878

ENTRYPOINT ["/app/Radarr", "-nobrowser", "-data=/config"]
