#!/usr/bin/env bash

echo Removing $(pwd)/data
rm -rf data

docker rm -f fnserver flow bristol flowui fnui
