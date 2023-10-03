#!/bin/bash

cd "$1"
shift
for values; do
    helm template -f "$values" . | kube-linter lint -
done
