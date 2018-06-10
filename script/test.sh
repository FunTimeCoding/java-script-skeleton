#!/bin/sh -e

if [ "${1}" = --ci-mode ]; then
    shift
    node_modules/grunt-cli/bin/grunt --gruntfile .GruntfileCI.js jshint "$@"
    node_modules/grunt-cli/bin/grunt --gruntfile .GruntfileCI.js jasmine_nodejs "$@"
else
    node_modules/grunt-cli/bin/grunt jasmine_nodejs "$@"
fi
