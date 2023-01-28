#!/bin/sh

set -e

if [ -z $TARGET ]; then
   TARGET=$1
fi

if [ -z $TARGET ]; then
    echo "Usage: $0 <commit id>"
    echo
    echo 'OR set $TARGET'
    exit 1
fi

echo Building $TARGET

git clone https://github.com/netxms/netxms.git netxms
cd netxms
git checkout $TARGET

build/prepare_release_build.sh
./configure --with-dist
make dist

echo
echo '### ALL DONE ###'
echo
echo Copying netxms-*.tar.gz to /dist/
cp -v netxms-*.tar.gz /dist/
