#!/usr/bin/env bash
# Fetches a HOT Export tar.gz, unpacks it, and puts in a directory.
# args: url, tmpDir

set -eo pipefail

echo "==> $0: Fetching and unpacking HOT Export into a temporary directory."
echo "      temp dir: "$2
echo

mkdir -p $2
curl -fL $1 | tar xzf - -C $2

echo "==> $0: END"
echo
