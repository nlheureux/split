#!/usr/bin/env bash
if ! tl check main.tl; then
    echo >&2
    exit 1
fi

tl gen main.tl
open -n -a love ../split
