#!/bin/sh -e

SCRIPT_DIR=$(cd $(dirname ${0}); pwd)

echo "Deleting cache files."

FILES="build  .coverage .sonar"

for FILE in ${FILES}; do
    if [ -e "${FILE}" ]; then
        echo "rm -rf ${FILE}"
        rm -rf "${SCRIPT_DIR}/${FILE}"
    fi
done
