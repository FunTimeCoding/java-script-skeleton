#!/bin/sh -e

if [ "${1}" = --ci-mode ]; then
    shift
    node_modules/.bin/grunt --gruntfile .GruntfileCI.js "$@"
else
    node_modules/.bin/grunt test "$@"
fi
