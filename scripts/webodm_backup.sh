#!/usr/bin/env bash

set -eo pipefail

if [ $(whoami) != "webodm" ]; then
  >&2 echo $0 is intended to run as webodm
  exit 1
fi

echo "==> $0"

backup_path=$1

# back up WebODM projects
echo "==> Backing up WebODM data to ${backup_path}"
cp -af /opt/data/webodm/. "${backup_path}"

echo '=> Backing up WebODM database to: ' $backup_path
echo '=> Dumping database...'
output="webodm-$(date +%Y%m%d%H%M%S).sql.gz"
pg_dump webodm | gzip > "${backup_path}/${output}"

echo "==> $0 END"
