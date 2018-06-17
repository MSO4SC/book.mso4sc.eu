#!/bin/bash

set -eo pipefail
set -x

BRANCH=${BRANCH:-${BUILDKITE_BRANCH:master}}
echo "--- Building $PROJECT..."
antora --html-url-extension-style=indexify antora-github-mso4sc-doc.yml
ls -lrta

tar  -c -z -f site.tar.gz build
buildkite-agent artifact upload site.tar.gz --job $BUILDKITE_JOB_ID
