#!/bin/sh
set -e

litestream restore -if-db-not-exists -if-replica-exists /data/db.sqlite3
litestream replicate
