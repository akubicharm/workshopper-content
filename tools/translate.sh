#!/bin/sh

TARGET=" \
application-health \
"

for f in $TARGET; do
  echo $f
  python translate.py ../$f.adoc $f.adoc
done

