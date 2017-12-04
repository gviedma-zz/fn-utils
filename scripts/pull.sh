#!/bin/bash

docker pull fnproject/fnserver:latest
docker pull fnproject/ui:latest

docker pull fnproject/flow:latest
docker pull fnproject/flow:ui

# java 8
docker pull fnproject/fn-java-fdk-build:latest
docker pull fnproject/fn-java-fdk:latest

# java 9
docker pull fnproject/fn-java-fdk:jdk9-latest
docker pull fnproject/fn-java-fdk-build:jdk9-latest

curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
