#!/bin/bash

ulimit -s 524288 && chmod -R 777 "$PWD" && export LD_LIBRARY_PATH=.

while true; do
    ./SecludedLauncher.out.sh
    
    exit_code=$?

    if [ "$exit_code" -ne 0 ]; then
        echo "code == $exit_code"
        sleep 1
    else
        break
    fi
done
