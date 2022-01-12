#!/bin/bash

docker buildx build --pull --platform linux/amd64,linux/arm64,linux/arm/v7 --target awscliv1 -t pwed/awscli:1 --platform linux/amd64,linux/arm64 --target awscliv2 -t pwed/awscli:2 -t pwed/awscli:latest .

# docker buildx build --platform linux/amd64,linux/arm64 --target awscliv2 -t pwed/awscli:2 -t pwed/awscli:latest .

# if [[ $1 == 'push' ]];
# then
#     docker push pwed/awscli:1
#     docker push pwed/awscli:2
#     docker pushrm pwed/awscli
# fi