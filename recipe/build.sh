#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.sub .
cp $BUILD_PREFIX/share/gnuconfig/config.guess .

if [ `uname` == Linux ]; then
    # Enable -z def linked flag
    # linking will fail when undefined symbols are present
    export CFLAGS="${CFLAGS} -Wl,-z,defs"
fi
echo "${CFLAGS}"
chmod +x configure
./configure CFLAGS="--std=c90 -Wno-implicit-function-declaration" --prefix=$PREFIX
make
make install