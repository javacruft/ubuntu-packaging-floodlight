#/bin/sh -e

VERSION=$2
TAR=../floodlight_$VERSION.orig.tar.gz
NEWTAR=../floodlight_$VERSION+dfsg.orig.tar.gz
DIR=floodlight-$VERSION
mkdir -p $DIR

# Unpack ready fo re-packing
tar -xzf $TAR -C $DIR --strip-components=1

# Repack excluding stuff we don't need
GZIP=--best tar -czf $NEWTAR --exclude '*.jar' --exclude '*.class' \
        --exclude 'backbone-min.js' --exclude 'bootstrap-*.js' \
        --exclude 'jquery.min.js' --exclude 'underscore-min.js' \
        --exclude 'd3.v2.min.js' --exclude 'bootstrap.css' $DIR

rm -rf $DIR $TAR

