#!/bin/bash

#!/bin/bash

if [ "$(uname)" == "Darwin" ]
then
    # for Mac OSX
    export CFLAGS="${CFLAGS} -std=c90,-Wno-implicit-function-declaration"
elif [ "$(uname)" == "Linux" ]
then
    # for Linux
    export CFLAGS="${CFLAGS} -Wl,-z,defs"
else
    echo "This system is unsupported by the toolchain."
    exit 1
fi
if [ ! -z "$ARCH" ]; then
    export CFLAGS="${CFLAGS} -m${ARCH}"
fi
