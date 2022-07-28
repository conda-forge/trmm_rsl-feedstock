#!/bin/bash

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.sub .
cp $BUILD_PREFIX/share/gnuconfig/config.guess .


chmod +x configure
./configure  --prefix=$PREFIX
make
make install
