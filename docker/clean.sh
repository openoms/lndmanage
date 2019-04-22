#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

. _settings.sh

# stop and remove all containers from lndmanage image (see https://stackoverflow.com/a/32074098/84283)
CONTAINERS=$(docker ps -a -q --filter ancestor=lndmanage --format="{{.ID}}")
if [[ -n "$CONTAINERS" ]]; then
  docker rm $(docker stop ${CONTAINERS})
fi

# clean source code stage
rm -rf lndmanage/_src

# clean volumes
rm -rf _volumes