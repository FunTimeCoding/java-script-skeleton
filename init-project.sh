#!/bin/sh -e
# This tool can be used to initialise the template after making a fresh copy to get started quickly.
# The goal is to make it as easy as possible to create scripts that allow easy testing and continuous integration.

CAMEL=${1}

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} MyUpperCamelCaseProjectName"
    exit 1
fi

if [[ ! ${CAMEL} =~ ^([A-Z][a-z0-9]+){2,}$ ]]; then
    echo "Project name must be in UpperCamelCase."
    exit 1
fi

DASH=$(echo ${CAMEL} | sed -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo ${DASH} | sed -E 's/-/_/g')
INITIALS=$(echo ${CAMEL} | sed 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]' )

echo "Camel: ${CAMEL}"
echo "Dash: ${DASH}"
echo "Initials: ${INITIALS}"

sed -i "" -e "s/em/${INITIALS}/g" web/index.html src/ConsoleMain.js src/WebMain.js spec/ExampleModuleSpec.js
sed -i "" -e "s/ExampleModule/${CAMEL}/g" web/index.html src/ConsoleMain.js src/WebMain.js src/ExampleModule.js spec/ExampleModuleSpec.js
sed -i "" -e "s/example-project/${DASH}/g" package.json web/index.html

git mv "src/ExampleModule.js" "src/${CAMEL}.js"
git mv "spec/ExampleModuleSpec.js" "spec/${CAMEL}Spec.js"
git mv "bin/example-script" "bin/${INITIALS}"

echo "Done. Files were edited and moved using git. Review those changes. You may also delete this script now."
