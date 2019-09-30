#!/usr/bin/env bash

set -ex

docker run --rm -it --user $UID:$UID -v "$(pwd):/home/devbase/build" jakkn/nwn-devbase -- extract