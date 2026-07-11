# Uptime Kuma

Self-hosted uptime and status monitor for services and hosts.

**Status:** running — Docker on `<ip>:3001`

- **Host**: `<host>` (`<ip>`)
- **Port**: 3001
- **Public URL**: `status.<domain>` (fronted by a reverse proxy such as Caddy)

## Notes

Monitors services via HTTP/TCP/ping checks and can push alerts to ntfy. Fronted by a reverse proxy (e.g. Caddy) for TLS at `status.<domain>`.
