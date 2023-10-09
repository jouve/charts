#!/bin/bash

.ct/kube-linter.sh "$@"
.ct/helm-unittest.sh "$1"
