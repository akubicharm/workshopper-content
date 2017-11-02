#!/bin/sh
#pipelines \
#codechanges \
#clustering \
#further-resources \

TARGET=" \
templates \
"

for f in $TARGET; do
  echo $f
  python translate.py ../$f.adoc $f.adoc
done

