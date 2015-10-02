#!/usr/bin/env bash

VER=$(docker --version | awk '{print $3}' | awk -F. '{print $1 * 10000 + $2 * 100 + $3}')

if (( $VER >= 10900 )) ; then
    sed -i -e "s|^#ARG|ARG|g" Dockerfile
    docker build -t yhfu/lamp-$(uname -m) --build-arg MYARCH=$(uname -m) .
else
    sed -i -e "s|\$MYARCH|$(uname -m)|g" Dockerfile
    docker build -t yhfu/lamp-$(uname -m) .
fi
