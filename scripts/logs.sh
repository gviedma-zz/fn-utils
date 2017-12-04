#!/bin/bash

APP=$1
CALLS=${2-10}

echo Printing last $CALLS calls for $APP

fn calls list $APP |grep ID |head -n $CALLS | xargs -L1 | sed -e 's/^ID://' |  sed -e 's/^[ \t]*//' | xargs -I {} sh -c "printf '\n\n**Call {} logs:\n'; fn logs get $APP {}"
