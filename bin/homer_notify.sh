#!/bin/bash -x

count=0
retries=10
sleepy=1

# Some time the random message is not a valid payload, CBFd fixing that so try again with exponential backoff
while [ $count -lt $retries ]
do
    curl -s -S -f -X POST -H 'Content-type: application/json' --data '{"text":"> “'"`homer.sh`"'”\n'"${1}"'"}' $2

    if [ $? -eq 0 ]
    then
        break
    else
        sleep $sleepy
        let sleepy*=2
        let count+=1
    fi
done
