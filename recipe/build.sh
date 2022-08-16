#!/bin/bash

if [ `uname` == Linux ]; then
    # Enable -z def linked flag
    # linking will fail when undefined symbols are present
    export CFLAGS="${CFLAGS} -Wl,-z,defs,-Wno-implicit-function-declaration"
fi
chmod +x configure
./configure  --prefix=$PREFIX
make
make check
make install