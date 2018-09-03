#!/bin/sh -e

docker images | grep --quiet funtimecoding/java-script-skeleton && FOUND=true || FOUND=false

if [ "${FOUND}" = true ]; then
    docker rmi funtimecoding/java-script-skeleton
fi

docker build --tag funtimecoding/java-script-skeleton .
