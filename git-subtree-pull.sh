#!/bin/bash

set -eux -o pipefail

git_subtree_pull () {
    src_url=$1
    src_tag=$2
    src_dir=$3
    tgt_dir=$4
    tmp=$(mktemp -d)
    git clone "$src_url" "$tmp"
    ref=$(git -C "$tmp" subtree split "--prefix=$src_dir" "$src_tag")
    git subtree pull "--prefix=$tgt_dir" "$tmp" "$ref"
}

git_subtree_pull https://github.com/cloudnative-pg/charts cloudnative-pg-v0.22.1 charts/cloudnative-pg charts/cloudnative-pg
git_subtree_pull https://github.com/coredns/helm          coredns-1.37.0         charts/coredns        charts/coredns
