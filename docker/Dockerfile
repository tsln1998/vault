# LiteStream versioned image
FROM litestream/litestream:0.5.2 AS litestream

# Vaultwarden
FROM vaultwarden/server:latest

COPY --from=litestream /usr/local/bin/litestream /usr/local/bin/litestream

COPY ./docker/litestream.generate.sh /
COPY ./docker/litestream.service.sh /
COPY ./docker/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
