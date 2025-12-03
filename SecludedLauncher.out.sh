#!/bin/bash

ulimit -s 524288 && chmod -R 777 "$PWD" && LD_LIBRARY_PATH=.

while true; do
    ./SecludedLauncher.out --cli
    
    exit_code=$?

    if [[ "$exit_code" -eq 0 && -d "upgrade" ]]; then
        cp -rf upgrade/* ./ 
        rm -rf upgrade
        continue
    fi

    break
done
