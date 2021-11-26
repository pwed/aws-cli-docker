FROM alpine:latest AS base

RUN apk update

RUN apk add py3-pip

FROM base AS awscliv1

RUN pip install awscli

FROM amazon/aws-cli AS awscliv2