#!/bin/bash
set -euo pipefail


tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=fly-www

mount -t nfs 100.75.3.66:/data/www /var/www

caddy run --config=/etc/caddy/Caddyfile
