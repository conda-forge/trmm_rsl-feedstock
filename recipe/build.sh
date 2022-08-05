#!/bin/bash

if [ `uname` == Linux ]; then
    # Enable -z def linked flag
    # linking will fail when undefined symbols are present
    apt-get install libbz2-dev
    export CFLAGS="${CFLAGS} -Wl,-z,defs"
fi
chmod +x configure
./configure  --prefix=$PREFIX
make
make install
