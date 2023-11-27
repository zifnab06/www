FROM ubuntu:22.04

# install caddy
RUN apt update && \
    apt install -y debian-keyring debian-archive-keyring apt-transport-https curl && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list && \
    apt update && apt install -y caddy nfs-common

# install tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale /var/www

COPY Caddyfile /etc/caddy/Caddyfile
COPY start.sh /start.sh

CMD /start.sh
