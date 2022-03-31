#!/bin/bash

BASEPATH=$(git rev-parse --show-toplevel)
cd "$BASEPATH/lambda"
export GOOS=linux
export GOARCH=amd64
export GOFLAGS=-trimpath
go build
touch -t 202002020000 cdk-sops-secrets
zip -X cdk-sops-lambda.zip cdk-sops-secrets
rm -f cdk-sops-secrets
cd ..
mkdir -p assets
mv lambda/cdk-sops-lambda.zip assets/cdk-sops-lambda.zip