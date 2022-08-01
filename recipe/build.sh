#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.sub .
cp $BUILD_PREFIX/share/gnuconfig/config.guess .

if [ `uname` == Linux ]; then
    # Enable -z def linked flag
    # linking will fail when undefined symbols are present
    export CFLAGS="${CFLAGS} -Wl,-z,defs"
elif [ `uname` == osx ]; then
    export CFLAGS="${CFLAGS} --std=c90,-Wno-implicit-function-declaration,-z"
    export L="/usr/local/lib"
fi
echo "${CFLAGS}"
export CFLAGS="${CFLAGS} -std=c90"
chmod +x configure
./configure --prefix=$PREFIX
make
make install