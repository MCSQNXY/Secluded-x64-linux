#!/bin/bash

ulimit -s 524288

export LD_LIBRARY_PATH=.

while true; do
    chmod -R 777 "$PWD"

    ./SecludedLauncher.out --console
    
    code=$?

    if [ -d "upgrade" ]; then
        if cp -rf upgrade/. ./; then
            rm -rf upgrade
        else
            echo "[ERROR] 升级文件复制失败，保留 upgrade 目录" >&2
        fi
        
        continue
    fi

    if [ "$code" -eq 0 ]; then
        if [ -f "engine.out" ]; then
            ./engine.out --console

            code=$?
        fi

        if [ "$code" -eq 0 ]; then
            exit 0
        fi
    fi

    echo "退出码 $code，5 秒后重启..."

    sleep 5
done
