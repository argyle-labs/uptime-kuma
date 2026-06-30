#!/usr/bin/env bash
# Creates and configures a uptime-kuma LXC on Proxmox VE. Run on the host as root.
set -euo pipefail
VMID="${1:?Usage: $0 <vmid> [options]}"
# TODO: pct create / config / install uptime-kuma. Mirror jellyfin/lxc/provision.sh.
echo "[provision] uptime-kuma LXC $VMID — not yet implemented"
