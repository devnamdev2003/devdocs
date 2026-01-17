#!/usr/bin/env bash
set -e

echo "Cleaning docs folder"
rm -rf docs
mkdir -p docs

echo "Copying root index.html"
cp index.html docs/index.html

echo "Building all mdBook projects"

for dir in md-code/*; do
  if [ -f "$dir/book.toml" ]; then
    echo "Building $(basename "$dir")"
    (cd "$dir" && mdbook build)
  fi
done

echo "Build complete"
