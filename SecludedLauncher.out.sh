#!/bin/bash

ulimit -s 524288
chmod -R 777 "$PWD"

export LD_LIBRARY_PATH=.

while true; do
    ./SecludedLauncher.out --console
    
    code=$?

    if [[ "$code" -eq 0 && -d "upgrade" ]]; then
        cp -rf upgrade/* ./ 
        rm -rf upgrade
        continue
    fi

    if [[ "$code" -eq 0 ]]; then
        if [ -f "engine-x64.out" ]; then
            ./engine-x64.out --console
        elif [ -f "engine-arm64.out" ]; then
            ./engine-arm64.out --console
        fi
    fi

    break
done
