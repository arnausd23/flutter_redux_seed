#!/bin/bash

MODE=$1
ENVIRONMENT=$2

if [ $MODE = "release" ]; then
    mv build/app/outputs/apk/release/app-release.apk build/app/outputs/apk/release/app-release-$ENVIRONMENT.apk
else
    mv build/app/outputs/apk/debug/app-debug.apk build/app/outputs/apk/debug/app-debug-$ENVIRONMENT.apk
fi