#!/bin/sh -e

rm -rf build
npm install
script/check.sh --ci-mode
#script/vagrant/test.sh
script/test.sh --ci-mode
