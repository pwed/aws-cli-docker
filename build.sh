#!/bin/bash
# ./build.sh [push]

if [[ $1 == 'push' ]];
then
    docker buildx bake --push
    # docker pushrm pwed/awscli
else
    docker buildx bake
fi