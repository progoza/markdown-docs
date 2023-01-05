#/bin/bash
mkdir -p _output
jekyll b -s ./cv -d ./_output/cv

mkdir -p _build
rm -rf ./_build/*
mkdir -p _build/cs4kids
cp -rf ./_theme/* _build/cs4kids/
cp -rf ./cs4kids/* _build/cs4kids/
jekyll b -s ./_build/cs4kids -d ./_output/cs4kids
