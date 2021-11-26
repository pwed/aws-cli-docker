# aws-cli-docker
Docker for running AWS CLI commands

## Why

This is so that you can have both versions of the AWS cli handy without breaking your pip installs

## Usage

I recomend adding the lines below to your `.bashrc` or `.zshrc`

``` bash
export AWS_PROFILE='default'
export AWS_DEFAULT_REGION='us-east-1'
alias aws1='docker run -it --rm -e AWS_PROFILE=$AWS_PROFILE -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -v $HOME/.aws:/root/.aws pwed/awscli:1'
alias aws2='docker run -it --rm -e AWS_PROFILE=$AWS_PROFILE -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -v $HOME/.aws:/root/.aws pwed/awscli:2'
```