#!/bin/bash

FLOW_SERVER=127.0.0.1:8081
echo Using Flow Server at $FLOW_SERVER

CURL_FLAGS="-s"
#CURL_FLAGS="-v"

flow_create() {
  export FID=$(curl $CURL_FLAGS -XPOST http://$FLOW_SERVER/v1/flows -d '{"function_id":"test/foo"}' | jq -r '.flow_id')
  echo Created flow with ID $FID
}

flow_add_delay() {
  tid=${1:-$FID}
  stage=$(curl $CURL_FLAGS -XPOST http://$FLOW_SERVER/v1/flows/$tid/delay -H 'Content-Type: text/json; charset=utf-8' -d '{"delay_ms": "10000" }' | jq -r '.stage_id')
  echo Created stage $stage
}

flow_get() {
  tid=${1:-$FID}
  curl $CURL_FLAGS -XGET http://$FLOW_SERVER/v1/flows/$tid -H 'Content-Type: text/json; charset=utf-8'
}

flow_await() {
  tid=${1:-$FID}
  stage=${2:-0}
  curl $CURL_FLAGS -XGET http://$FLOW_SERVER/v1/flows/$tid/stages/$stage/await -H 'Content-Type: text/json; charset=utf-8'
}

flow_commit() {
  tid=${1:-$FID}
  curl $CURL_FLAGS -XPOST http://$FLOW_SERVER/v1/flows/$tid/commit
}
