#!/bin/sh -e

if [ $# -eq 0 ]; then
    echo "Starting grunt in watch mode. Press ctrl+c to abort."
    node_modules/grunt-cli/bin/grunt watch
else
    node_modules/grunt-cli/bin/grunt "$@"
fi
