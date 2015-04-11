#!/bin/sh -e
if [ "${1}" = "--ci-mode" ]; then
    shift
    #mkdir -p "build/log"
    node_modules/grunt-cli/bin/grunt --gruntfile GruntfileCI.js jshint $@
else
    node_modules/grunt-cli/bin/grunt jshint $@
fi
