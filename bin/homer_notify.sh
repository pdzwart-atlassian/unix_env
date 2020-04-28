#!/bin/bash -x

curl -X POST -H 'Content-type: application/json' --data '{"text":"> “'"`homer.sh`"'”\n'"${1}"'"}' $2
