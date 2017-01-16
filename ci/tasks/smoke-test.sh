#!/bin/bash

set -e

apt-get update && apt-get install -y curl

set -x

if [ -z $MOVIE_FUN_URL ]; then
  echo "MOVIE_FUN_URL not set"
  exit 1
fi

pushd movie-fun-source
  echo "Running smoke tests for Movie Fun deployed at $MOVIE_FUN_URL"
  smoke-tests/bin/test $MOVIE_FUN_URL
popd

exit 0
