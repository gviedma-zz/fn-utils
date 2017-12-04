#!/usr/bin/env bash

echo Removing $(pwd)/data
sudo rm -rf data

(fn start > /dev/null 2>&1 &)

sleep 5

DOCKER_LOCALHOST=$(docker inspect --type container -f '{{.NetworkSettings.Gateway}}' functions)

docker run --rm  \
       -p 8081:8081 \
       -d \
       -e API_URL="http://$DOCKER_LOCALHOST:8080/r" \
       -e no_proxy=$DOCKER_LOCALHOST \
       --name flow \
       fnproject/flow:latest

docker run --rm \
       -p 3002:3000 \
       -d \
       --name flowui \
       -e API_URL=http://$DOCKER_LOCALHOST:8080 \
       -e COMPLETER_BASE_URL=http://$DOCKER_LOCALHOST:8081 \
       fnproject/flow:ui

docker run --rm \
       -p 4000:4000 \
       -d \
       --name fnui \
       -e API_URL=http://$DOCKER_LOCALHOST:8080 \
       fnproject/ui
