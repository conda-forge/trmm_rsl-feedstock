#!/bin/bash

if [ `uname` == Linux ]; then
    # Enable -z def linked flag
    # linking will fail when undefined symbols are present
    export CFLAGS="${CFLAGS} -Wl,-z,defs"
fi
chmod +x configure
./configure  --prefix=$PREFIX CXXFLAGS="-I$PREFIX/include -L$PREFIX/lib $CXXFLAGS"
make
make install