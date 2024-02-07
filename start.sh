#!/bin/bash
set -euo pipefail


tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
tailscale up --auth-key=${TAILSCALE_OAUTHKEY} --advertise-tags=tag:fly

caddy run --config=/etc/caddy/Caddyfile
