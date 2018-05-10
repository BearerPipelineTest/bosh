#!/bin/bash

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

exec fly -t production set-pipeline \
  -p bosh:docker-images \
  -c ./pipeline.yml \
  --load-vars-from <(lpass show --note "bosh:docker-images concourse secrets")
