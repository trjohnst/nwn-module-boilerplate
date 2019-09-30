#!/usr/bin/env bash

set -ex

# Compile
docker run --rm -it --user $UID:$UID -v "$(pwd)/src/nss:/tmp" -v "$(pwd)/.nwnproject/cache:/cache" --entrypoint "" jakkn/nwnsc bash -c "nwnsc -o -n /nwn/data -y -b /cache/gff *.nss"

# Build Module
docker run --rm -it --user $UID:$UID -v "$(pwd):/home/devbase/build" --entrypoint "" jakkn/nwn-devbase bash -c "nwn-build pack"