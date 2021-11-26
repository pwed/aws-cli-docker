#!/bin/bash

docker build --target awscliv1 -t pwed/awscli:1 .

docker build --target awscliv2 -t pwed/awscli:2 .

if [[ $1 == 'push' ]];
then
    docker push pwed/awscli:1
    docker push pwed/awscli:2
    docker pushrm pwed/awscli
fi