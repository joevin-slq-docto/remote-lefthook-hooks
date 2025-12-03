#!/usr/bin/env bash

eval "$(mise -C $(dirname "${BASH_SOURCE}")/../.. env)"

prettier --check "$@"
