#!/bin/bash

SANITAS_FILE_URL="$1"

# Sanity checks
if [ -z "$SANITAS_FILE_URL" ]; then
  echo "Usage: $0 <sanitas file URL>" >&2
  exit 1
fi

if [ ! -f "package.json" ]; then
  echo "Error: no package.json in the current directory" >&2
  exit 1
fi

# JQ command to merge the 'dependencies' key of the two files
# But maintain duplicates (so there are duplicate keys and NPM can yell)

# Or: can npm take two separate package.json files?

# Or: can we install the global package.json from $SANITAS_FILE_URL first,
# and then install this project to the same dir and see if it complains?
# (e.g. maybe package.lock will cause it to complain?)

curl "$SANITAS_FILE_URL" | jq .dependencies
