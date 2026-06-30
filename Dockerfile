# TODO: base image + build for uptime-kuma. Mirror jellyfin/Dockerfile conventions.
FROM debian:12-slim
LABEL org.opencontainers.image.source="https://github.com/argyle-labs/uptime-kuma"
EXPOSE 3001
