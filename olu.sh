#!/bin/bash -x
GO_SRC="/go/src"
LND_REPO="github.com/kamcpp/lnd"
LND_DIR="$GO_SRC/$LND_REPO"

cd $LND_DIR
dep ensure
cd /
rm -rf deps
./build.sh $LND_REPO
