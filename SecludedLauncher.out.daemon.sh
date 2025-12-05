#!/bin/bash

ulimit -s 524288
chmod -R 777 "$PWD"

export LD_LIBRARY_PATH=.

while true; do
    ./SecludedLauncher.out.sh
    
    code=$?

    if [ "$code" -ne 0 ]; then
        echo "code == $code"
        sleep 1
        continue
    fi
    
    break
done
