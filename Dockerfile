FROM alpine:latest AS base

RUN apk update && apk upgrade

RUN apk add py3-pip python3 less groff

FROM base AS awscliv1

RUN pip install awscli

FROM base AS awscliv2

RUN apk add curl unzip gcompat git gcc python3-dev libffi-dev musl-dev cmake make openssl-dev zlib-dev

RUN echo "The prebuilt packages do not support alpine :(. Building from source!" && \
    git clone https://github.com/aws/aws-cli.git && cd aws-cli && git checkout v2 && \
    pip install -r requirements.txt && \
    pip install -e . && \
    cd .. && rm -rf aws-cli

RUN apk del curl unzip git gcc python3-dev libffi-dev musl-dev cmake make openssl-dev zlib-dev