#!/bin/bash

ulimit -s 524288 && chmod -R 777 "$PWD" && export LD_LIBRARY_PATH=.

while true; do
    ./SecludedLauncher.out --cli
    
    exit_code=$?

    if [[ "$exit_code" -eq 0 && -d "upgrade" ]]; then
        cp -rf upgrade/* ./ 
        rm -rf upgrade
        continue
    fi

    if [ "$exit_code" -ne 0 ]; then
        echo "code == $exit_code"
        sleep 1
        continue
    fi
    
    break
done
