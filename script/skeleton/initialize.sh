#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"
NAME=$(echo "${1}" | grep --extended-regexp '^([A-Z]+[a-z0-9]*){1,}$') || NAME=''

if [ "${NAME}" = '' ]; then
    echo "Usage: ${0} NAME"
    echo "Name must be in upper camel case."

    exit 1
fi

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED='gsed'
    FIND='gfind'
else
    SED='sed'
    FIND='find'
fi

rm -rf script/skeleton
DASH=$(echo "${NAME}" | ${SED} --regexp-extended 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${NAME}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} --regexp-extended 's/-/_/g')
LOWER_CAMEL=$(echo "${NAME}" | ${SED} --expression 's/^./\L&\E/')
# shellcheck disable=SC2016
# TODO: Delete after testing the include way works throughout all projects.
#${FIND} . -regextype posix-extended -type f ! -regex "${EXCLUDE_FILTER}" -exec sh -c '${1} --in-place --expression "s/JavaScriptSkeleton/${2}/g" --expression "s/java-script-skeleton/${3}/g" --expression "s/java_script_skeleton/${4}/g" --expression "s/javaScriptSkeleton/${5}/g" "${6}"' '_' "${SED}" "${NAME}" "${DASH}" "${UNDERSCORE}" "${LOWER_CAMEL}" '{}' \;
${FIND} . -regextype posix-extended -type f -regex "${INCLUDE_FILTER}" -exec sh -c '${1} --in-place --expression "s/JavaScriptSkeleton/${2}/g" --expression "s/java-script-skeleton/${3}/g" --expression "s/java_script_skeleton/${4}/g" --expression "s/javaScriptSkeleton/${5}/g" "${6}"' '_' "${SED}" "${NAME}" "${DASH}" "${UNDERSCORE}" "${LOWER_CAMEL}" '{}' \;
# shellcheck disable=SC1117
${SED} --in-place --expression "s/bin\/jss/bin\/${INITIALS}/g" README.md Dockerfile
git mv src/JavaScriptSkeleton.js "src/${NAME}.js"
git mv spec/JavaScriptSkeletonSpec.js "spec/${NAME}Spec.js"
git mv bin/jss "bin/${INITIALS}"
echo "# This dictionary file is for domain language." > "documentation/dictionary/${DASH}.dic"
