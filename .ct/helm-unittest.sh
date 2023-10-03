#!/bin/bash

set -e

if [ -d "$1/tests" ]; then
    helm unittest "$1"
fi
