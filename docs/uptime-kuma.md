# Uptime Kuma

Self-hosted uptime and status monitor for websites, services, and hosts. Runs
as a single container; all state lives in one data volume.

## Operator notes

- **Web UI / port**: `3001` (HTTP). Map it to the host and open
  `http://<host>:3001` to reach the dashboard.
- **First-run setup**: on first visit the UI prompts you to create an admin
  account and set a password. There is no default login — complete this step
  before exposing the service.
- **Data**: everything (monitors, notifications, history, settings) is stored
  under `/app/data` in the container. Persist this path with a volume; it is
  the entire service state.
- **Monitors**: supports HTTP(S), TCP, ping, DNS, and other check types, plus
  notification integrations for alerting.
- **TLS / public exposure**: the service speaks plain HTTP. Front it with a
  reverse proxy if you need TLS or a public hostname.

See the [README](../README.md) for run-by-hand and orca deployment steps, and
upstream <https://github.com/louislam/uptime-kuma> for full documentation.
