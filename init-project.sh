#!/bin/sh -e
# This tool is to initialize the project after cloning.
# The goal is to make easy to create and test new projects.

CAMEL=$(echo "${1}" | grep -E '^([A-Z]+[a-z0-9]*){2,}$') || CAMEL=""

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} UpperCamelCaseName"

    exit 1
fi

OPERATING_SYSTEM=$(uname)

if [ "${OPERATING_SYSTEM}" = "Linux" ]; then
    SED="sed"
    FIND="find"
else
    SED="gsed"
    FIND="gfind"
fi

DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
FIRST_LETTER=$(echo "${CAMEL}" | cut -c 1 | tr '[:upper:]' '[:lower:]')
LOWER_CAMEL=${FIRST_LETTER}$(echo "${CAMEL}" |cut -c2-)
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]' )
rm init-project.sh sync-project.sh
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(build|node_modules|\.git|\.idea)/.*$' -exec sh -c '${1} -i -e "s/JavaScriptSkeleton/${2}/g" -e "s/javaScriptSkeleton/${3}/g" -e "s/java-script-skeleton/${4}/g" -e "s/jss/${5}/g" "${6}"' '_' "${SED}" "${CAMEL}" "${LOWER_CAMEL}" "${DASH}" "${INITIALS}" '{}' \;
git mv src/JavaScriptSkeleton.js src/"${CAMEL}".js
git mv spec/JavaScriptSkeletonSpec.js spec/"${CAMEL}"Spec.js
git mv bin/jss bin/"${INITIALS}"
echo "Done. Files were edited and moved. Review those changes."
