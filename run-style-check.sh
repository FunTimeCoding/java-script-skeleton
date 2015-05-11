#!/bin/sh -e

CI_MODE=0

if [ "${1}" = "--ci-mode" ]; then
    shift
    CI_MODE=1
fi

#     12345678901234567890123456789012345678901234567890123456789012345678901234567890
echo "================================================================================"
echo ""
echo "Running JSHint."

if [ "${CI_MODE}" = "1" ]; then
    node_modules/grunt-cli/bin/grunt --gruntfile .GruntfileCI.js jshint "$@"
else
    node_modules/grunt-cli/bin/grunt jshint "$@"
fi

echo ""
echo "================================================================================"

echo ""
echo "Running ShellCheck."
find . -name '*.sh' -and -not -path '*/node_modules/*' -exec sh -c "shellcheck {} || true" \;
echo ""
echo "================================================================================"
