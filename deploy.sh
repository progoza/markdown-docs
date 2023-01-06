#/bin/bash
HTTP_REPO="../progoza.github.io"
rm -rf $HTTP_REPO/cv/
mkdir -p $HTTP_REPO/cv/
cp -r ./_output/cv/* $HTTP_REPO/cv/
rm -rf $HTTP_REPO/cs4kids
mkdir -p $HTTP_REPO/cs4kids
cp -r ./_output/cs4kids/* $HTTP_REPO/cs4kids/
