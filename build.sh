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
echo "All mdBooks built successfully"
echo "==============================="
