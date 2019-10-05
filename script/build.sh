#!/bin/sh -e

rm -rf build
npm install
script/check.sh --ci-mode
script/measure.sh --ci-mode
script/test.sh --ci-mode
SYSTEM=$(uname)

if [ "${SYSTEM}" = Linux ]; then
    script/debian/package.sh
fi

# TODO: Finish implementation.
#script/docker/build.sh
