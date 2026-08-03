<p align="center">
  <img src="assets/icon-256.png" width="120" alt="uptime-kuma" />
</p>

# uptime-kuma

Uptime Kuma is a self-hosted monitoring tool for websites and services.

A first-party [orca](https://github.com/argyle-labs/orca) plugin (service-backend).

This repo is **self-contained** — the steps below run uptime-kuma **by hand, without orca**. orca automates exactly this (same image, ports, and data) through one generic surface.

---

## Run it without orca

### Docker Compose

```yaml
# compose.yml
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    restart: unless-stopped
    ports:
      - "3001:3001/tcp"   # web UI
    volumes:
      - ./data:/app/data
```

```sh
docker compose up -d
```

### Other runtimes

**Podman** — the compose above works with `podman compose up -d`, or run it directly:

```sh
podman run -d --name uptime-kuma --restart unless-stopped \
    -p 3001:3001/tcp \
    -v ./data:/app/data \
    louislam/uptime-kuma:1
```

**LXC** — on a container-capable LXC (e.g. a Proxmox LXC with nesting enabled) run the same image via Docker/Podman as above, or install uptime-kuma from upstream directly on the guest: <https://github.com/louislam/uptime-kuma>.

**VM** — install uptime-kuma from upstream (<https://github.com/louislam/uptime-kuma>) or run the same container image inside the VM; expose port `3001`.

**Unraid** — add via *Community Applications*, or *Docker → Add Container* with image `louislam/uptime-kuma:1`, port `3001`, and the volume paths above.

### Ports & data

| | |
|---|---|
| Default port | `3001` |
| Upstream | <https://github.com/louislam/uptime-kuma> |


### Backup & restore

Back up the config/data volume(s) above — that's the whole service state (stop the container first for a clean copy). Restore by putting them back and starting it.

> With orca this is **`service.backup` / `service.restore`** — location-agnostic (docker / podman / lxc / vm), one command regardless of where uptime-kuma runs. No per-service backup script.

## With orca

orca drives this plugin through the single generic `service.*` surface — no per-plugin tools:

```sh
orca service.deploy uptime-kuma      # render + launch on any supported runtime
orca service.backup uptime-kuma      # location-agnostic backup (tar; PBS on Proxmox)
```

`service.status` (health + rich diagnostics) and `service.configure` (apply config via the upstream API) are **planned** — the descriptor declares them, but they are not yet implemented (the current handlers return an unimplemented stub).

## Layout

- `src/` — the plugin (pure Rust): the `ServiceBackend` descriptor + `configure` / `status`.
- [CAPABILITIES.md](CAPABILITIES.md) — the service-backend contract checklist.
- `assets/` — plugin icon.
