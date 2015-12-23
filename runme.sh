#!/usr/bin/env bash

#VER=$(docker --version | awk '{print $3}' | awk -F. '{print $1 * 10000 + $2 * 100 + $3}')
#if (( $VER >= 10900 )) ; then
#    sed -e "s|^#ARG|ARG|g" \
#        -e "s|yhfudev/docker-archlinux|yhfu/archlinux-\$MYARCH|g" \
#        -i Dockerfile
#    docker build -t yhfu/lamp-$(uname -m) --build-arg MYARCH=$(uname -m) .
#fi
sed -e "s|yhfudev/docker-archlinux|yhfu/archlinux-$(uname -m)|g" \
    -i Dockerfile
docker build -t yhfu/lamp-$(uname -m) .
