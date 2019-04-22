#!/usr/bin/env bash
echo Building docker-multi-stage-builds/builder-pattern:build

docker build -t docker-multi-stage-builds/builder-pattern:build . -f Dockerfile.build

docker container create --name extract docker-multi-stage-builds/builder-pattern:build

docker container cp extract:/go/src/github.com/zhooravell/docker-multi-stage-builds/builder-pattern/app ./app

docker container rm -f extract

echo Building docker-multi-stage-builds/builder-pattern:latest

docker build --no-cache -t docker-multi-stage-builds/builder-pattern:latest .

rm ./app