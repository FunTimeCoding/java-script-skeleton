#!/bin/sh -e

ARGS=$(getopt -o w:p:hcv -l workspace:,help,clean,verbose --name "${0}" -- "$@")
CLEAN=0

while true; do
    case ${1} in
        -w|--workspace)
            WORKSPACE=(${2-})
            echo "workspace: ${WORKSPACE}"
            shift 2
            ;;
        -h|--help)
            echo "Usage: [-h][-c|--clean][-w|--workspace WORKSPACE]"
            exit
            ;;
        -c|--clean)
            CLEAN=1
            shift
            ;;
        -v|--verbose)
            set -x
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            if [ ! "${1}" = "" ]; then
                echo "Unknown option: $1"
            fi
            break
            ;;
    esac
done

if [ "${WORKSPACE}" = "" ]; then
    SCRIPT_DIR=$(cd $(dirname ${0}); pwd)
    WORKSPACE="${SCRIPT_DIR}"
fi
echo "WORKSPACE: ${WORKSPACE}"

rm -rf "${WORKSPACE}/build"
npm up
"${WORKSPACE}"/run-lint-check.sh --ci-mode
"${WORKSPACE}"/run-metrics.sh --ci-mode
"${WORKSPACE}"/run-tests.sh --ci-mode
"${WORKSPACE}"/grunt.sh build
