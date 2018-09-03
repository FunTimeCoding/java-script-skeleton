#!/bin/sh -e

rm -rf build
npm install
script/check.sh --ci-mode
script/test.sh --ci-mode
# TODO: Finish implementation, then uncomment.
#script/docker/build.sh
