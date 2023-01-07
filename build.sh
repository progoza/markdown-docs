#/bin/bash
mkdir -p .output
jekyll b -s ./cv -d ./.output/cv

mkdir -p .build
rm -rf ./.build/*
mkdir -p .build/cs4kids
cp -rf ./.theme/* .build/cs4kids/
cp -rf ./cs4kids/* .build/cs4kids/
jekyll b -s .build/cs4kids -d .output/cs4kids
