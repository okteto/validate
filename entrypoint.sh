#!/bin/sh

set -e

file=$1
log_level=$2

command="validate"

params="--log-output plain"

if [ -n "$file" ]; then
   params="$params -f $file"
fi

if [ ! -z "$log_level" ]; then
  log_level="--log-level ${log_level}"
fi

# https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging
# https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables
if [ "${RUNNER_DEBUG}" = "1" ]; then
  log_level="--log-level debug"
fi

echo running: okteto "$command" "$params $log_level"
# shellcheck disable=SC2086
okteto $command $params $log_level