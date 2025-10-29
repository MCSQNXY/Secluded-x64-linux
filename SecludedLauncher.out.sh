#!/bin/bash

ulimit -s 524288 && chmod -R 777 "$PWD" && LD_LIBRARY_PATH=.

while true; do
    ./SecludedLauncher.out 
    
    exit_code=$?

    if [[ "$exit_code" -eq 0 && -d "updater" ]]; then
        cp -rf updater/* ./ 
        rm -rf updater
        continue
    fi

    break
done
