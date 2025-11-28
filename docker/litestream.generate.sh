#!/bin/sh

# preset litestream config
[ ! -z "${LITESTREAM_CONF}" ] && \
  echo "${LITESTREAM_CONF}" > /etc/litestream.yml && \
  exit 0

# generate litestream config
[ -z "${S3_ACCESS_KEY_ID}" ] && exit 1
[ -z "${S3_SECRET_ACCESS_KEY}" ] && exit 1
[ -z "${S3_BUCKET}" ] && exit 1
[ -z "${S3_PATH}" ] && exit 1
[ -z "${S3_ENDPOINT}" ] && exit 1

cat > /etc/litestream.yml <<EOF
exec: /start.sh
addr: ":9090"
access-key-id:      ${S3_ACCESS_KEY_ID}
secret-access-key:  ${S3_SECRET_ACCESS_KEY}
dbs:
- path:             /data/db.sqlite3
  replica:
    type:           s3
    bucket:         ${S3_BUCKET}
    path:           ${S3_PATH}
    endpoint:       ${S3_ENDPOINT}
    retention:      720h
EOF
