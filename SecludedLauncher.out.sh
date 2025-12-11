#!/bin/bash

ulimit -s 524288

export LD_LIBRARY_PATH=.

while true; do
    chmod -R 777 "$PWD"

    ./SecludedLauncher.out --console
    
    code=$?

    if [[ "$code" -eq 0 && -d "upgrade" ]]; then
        cp -rf upgrade/* ./ 
        rm -rf upgrade
        continue
    fi

    if [[ "$code" -eq 0 ]]; then
        if [ -f "engine.out" ]; then
            ./engine.out --console
        fi
    fi

    break
done
