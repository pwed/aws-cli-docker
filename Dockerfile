FROM alpine:latest AS base

RUN apk update && apk upgrade

RUN apk add py3-pip python3

FROM base AS awscliv1

RUN pip install awscli

RUN apk del py3-pip

FROM base AS awscliv2

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN apk add curl unzip gcompat groff less git

RUN if [ ${TARGETPLATFORM} == "linux/amd64" ]; \
        then curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" ; \
    elif [ ${TARGETPLATFORM} == "linux/arm64" ]; \
        then curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" ; \
    else \
        git clone https://github.com/aws/aws-cli.git && \
        cd aws-cli && git checkout v2 && \
        pip install -r requirements.txt && \
        pip install -e . && \
        cd .. && rm -rf aws-cli && \
        exit 0 ; \
    fi && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./awscliv2.zip ./aws

RUN apk del curl unzip py3-pip git