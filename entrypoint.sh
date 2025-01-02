#!/bin/sh

set -e

file=$1

command="validate"

params="--log-output plain"

if [ -n "$file" ]; then
   params="$params -f $file"
fi

params="$params $tests"

echo running: okteto "$command" "$params"
# shellcheck disable=SC2086
okteto $command $params