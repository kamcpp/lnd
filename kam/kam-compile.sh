#!/bin/bash -x

mkdir -p $PWD/build

docker run -v $PWD/build:/build kamcpp/rawtxlnd-xgo-wrapper
