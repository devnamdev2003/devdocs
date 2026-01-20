#!/usr/bin/env bash
set -e   # stop script if any command fails

echo "==============================="
echo "Cleaning docs folder (contents only)"

if [ -d "docs" ]; then
    rm -rf docs/*
    echo "Docs folder cleared"
else
    mkdir docs
    echo "Docs folder created"
fi

echo "==============================="
echo "Building all mdBook projects"
echo "==============================="

for dir in md-code/*/; do
    echo "-------------------------------"
    echo "Building $(basename "$dir")"
    echo "-------------------------------"

    cd "$dir"
    mdbook clean
    mdbook build
    cd - > /dev/null
done

echo "==============================="
echo "Fixing root index.html"
echo "==============================="

# If root index.html exists, move it into docs
if [ -f "index.html" ]; then
    mv index.html docs/index.html
    echo "Moved root index.html → docs/index.html"
else
    echo "No root index.html found, skipping"
fi

echo "==============================="
echo "All mdBooks built successfully"
echo "==============================="
