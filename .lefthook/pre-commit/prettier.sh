#!/usr/bin/env bash

eval "$(mise -C $(dirname "${BASH_SOURCE}")/../.. env)"

prettier --check . # can't use {staged_files} here
