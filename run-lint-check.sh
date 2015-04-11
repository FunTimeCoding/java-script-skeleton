#!/bin/sh -e
if [ "${1}" = "--ci-mode" ]; then
    shift
    node_modules/grunt-cli/bin/grunt --gruntfile GruntfileCI.js jshint $@
else
    node_modules/grunt-cli/bin/grunt jshint $@
fi
