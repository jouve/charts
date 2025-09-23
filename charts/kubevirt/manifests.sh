#!/bin/bash

set -eux -o pipefail
rm -rf crds templates
mkdir crds templates
# shellcheck disable=SC2016
kubectl kustomize | yq --no-doc --split-exp 'select(.kind == "CustomResourceDefinition") | .metadata.name | sub(".*", "crds/${0}.yaml")'
kubectl kustomize | yq --no-doc --split-exp 'select(.kind != "CustomResourceDefinition") | .metadata.name | sub(".*", "templates/${0}.yaml")'
# shellcheck disable=SC2016
yq -i '.appVersion = (load("kustomization.yaml").resources.0 | sub(".*/(v[^/]+)/.*", "$1"))' Chart.yaml
