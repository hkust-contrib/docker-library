ARG CADDY_VERSION="latest"
FROM caddy:builder AS builder
RUN xcaddy build --with github.com/ss098/certmagic-s3

FROM caddy:${CADDY_VERSION}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy