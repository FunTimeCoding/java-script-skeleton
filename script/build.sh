#!/bin/sh -e

rm -rf build
npm install
script/check.sh --ci-mode
script/measure.sh --ci-mode
script/test.sh --ci-mode
#SYSTEM=$(uname)
#
# TODO: Needs polish.
#if [ "${SYSTEM}" = Linux ]; then
#    script/debian/package.sh
#    script/docker/build.sh
#fi
