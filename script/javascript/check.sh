#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"

if [ "${1}" = --help ]; then
    echo "Usage: ${0} [--ci-mode]"

    exit 0
fi

CONCERN_FOUND=false
CONTINUOUS_INTEGRATION_MODE=false

if [ "${1}" = --ci-mode ]; then
    shift
    mkdir -p build/log
    CONTINUOUS_INTEGRATION_MODE=true
fi

if [ "${CONTINUOUS_INTEGRATION_MODE}" = true ]; then
    node_modules/grunt-cli/bin/grunt --gruntfile .GruntfileCI.js jshint
else
    node_modules/grunt-cli/bin/grunt jshint
fi

if [ "${CONCERN_FOUND}" = true ]; then
    echo
    echo "Warning level concern(s) found." >&2

    exit 2
fi
