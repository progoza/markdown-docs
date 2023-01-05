#/bin/bash
HTTP_REPO="../progoza.github.io"
mkdir -p $HTTP_REPO/cv/
cp -r ./_output/cv/* $HTTP_REPO/cv/
mkdir -p $HTTP_REPO/cs4kids
cp -r ./_output/cs4kids/* $HTTP_REPO/cs4kids/
