#!/usr/bin/env bash
set -euo pipefail

# renovate: datasource=npm depName=tree-sitter-cli
TREE_SITTER_VERSION=0.27.1

cd "$(dirname "$0")/.."

repo=$(awk -F'"' '/^\[grammars\./ { g = 1 } g && /^repository/ { print $2; exit }' extension.toml)
commit=$(awk -F'"' '/^\[grammars\./ { g = 1 } g && /^commit/ { print $2; exit }' extension.toml)

grammar=$(mktemp -d)
trap 'rm -rf "$grammar"' EXIT

git init -q "$grammar"
git -C "$grammar" fetch -q --depth 1 "$repo" "$commit"
git -C "$grammar" checkout -q FETCH_HEAD

for query in languages/volt/*.scm; do
  echo "Checking $query"
  npx --yes "tree-sitter-cli@${TREE_SITTER_VERSION}" query --grammar-path "$grammar" "$query" tests/sample.volt >/dev/null
done
