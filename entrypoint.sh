#!/bin/sh

set -e

file=$1

command="validate"

params="--log-output plain"

if [ -n "$file" ]; then
   params="$params -f $file"
fi

params="$params $tests"

# https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging
# https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables
if [ "${RUNNER_DEBUG}" = "1" ]; then
  params="${params} --log-level debug"
fi

echo running: okteto "$command" "$params"
# shellcheck disable=SC2086
okteto $command $params