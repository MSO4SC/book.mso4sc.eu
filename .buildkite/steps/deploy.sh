#!/bin/bash

set -eo pipefail
set -x

BRANCH=${BRANCH:-${BUILDKITE_BRANCH:master}}
export WEBSERVER=es15.siteground.eu

echo "--- Deploying $PROJECT..."
buildkite-agent artifact download site.tar.gz .
rsync -avz _site/ $WEBSERVER:~/public_html/$PROJECT
