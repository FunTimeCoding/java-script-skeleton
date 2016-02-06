#!/bin/sh -e

npm up
./run-style-check.sh --ci-mode
./run-metrics.sh --ci-mode
./run-tests.sh --ci-mode
./grunt.sh build
