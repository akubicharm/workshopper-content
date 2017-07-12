#!bin/sh

TARGET=" \
install \
explore \
docker \
scaling \
routes \
java \
databases \
templates \
"

for f in $TARGET; do
  echo $f
  python translate.py ../$f.adoc $f.adoc
done

