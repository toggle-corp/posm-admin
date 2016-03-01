#!/usr/bin/env bash
# Fetches a HOT Export tar.gz, unpacks it, and puts in a directory.
# args: url, tmpDir	
mkdir -p $2
curl $1 | pv | tar zxf - -C $2

echo "hot-export-fetch.sh : The hot export has been fetched and unpacked into a temporary directory."
