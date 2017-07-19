#!/bin/bash

set -eo pipefail
set -x

BRANCH=${BRANCH:-${BUILDKITE_BRANCH:master}}
export WEBSERVER=es15.siteground.eu

echo "--- Deploying $PROJECT..."
rsync -avz _site/ $WEBSERVER:~/public_html/$PROJECT
