#!/bin/sh -e
# This tool can be used to initialise the template after making a fresh copy to get started quickly.
# The goal is to make it as easy as possible to create scripts that allow easy testing and continuous integration.

CAMEL=$(echo "${1}" | grep -E '^([A-Z][a-z0-9]+){2,}$') || CAMEL=""

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} UpperCamelCaseName"

    exit 1
fi

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    SED="gsed"
else
    SED="sed"
fi

FIRST_LETTER=$(echo "${CAMEL}" | cut -c 1 | tr '[:upper:]' '[:lower:]')
LOWER_CAMEL=${FIRST_LETTER}$(echo "${CAMEL}" |cut -c2-)
DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]' )
echo "LOWER_CAMEL: ${LOWER_CAMEL}"
echo "DASH: ${DASH}"
echo "INITIALS: ${INITIALS}"
find -E . -type f ! -regex '^.*/(build|node_modules|\.git|\.idea)/.*$' -exec sh -c '${1} -i -e "s/JavaScriptSkeleton/${2}/g" -e "s/javaScriptSkeleton/${3}/g" -e "s/java-script-skeleton/${4}/g" -e "s/jss/${5}/g" ${6}' '_' "${SED}" "${CAMEL}" "${LOWER_CAMEL}" "${DASH}" "${INITIALS}" '{}' \;
git mv src/JavaScriptSkeleton.js "src/${CAMEL}.js"
git mv spec/JavaScriptSkeletonSpec.js "spec/${CAMEL}Spec.js"
git mv bin/jss "bin/${INITIALS}"
rm init-project.sh
echo "Done. Files were edited and moved using git. Review those changes."
