#!/bin/bash

set -eux -o pipefail
rm -rf templates
mkdir templates
# shellcheck disable=SC2016
kustomize build | yq --no-doc --split-exp '.metadata.name | sub(".*", "templates/${0}.yaml")'
# shellcheck disable=SC2016
yq -i '.appVersion = (load("kustomization.yaml").resources.0 | sub(".*ref=(.*)", "$1"))' Chart.yaml
