#/bin/bash
HTTP_REPO="../progoza.github.io"
rm -rf $HTTP_REPO/cv/
mkdir -p $HTTP_REPO/cv/
cp -r ./.output/cv/* $HTTP_REPO/cv/
rm -rf $HTTP_REPO/cs4kids
mkdir -p $HTTP_REPO/cs4kids
cp -r ./.output/cs4kids/* $HTTP_REPO/cs4kids/
