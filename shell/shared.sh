#!/bin/bash

mkdd() {
    local dir
    dir=$(date $DATE_FORMAT);
    mkdir -p "${dir}" && cd "${dir}";
}

# This allows functions from the script to be called as parameters when run
$@
