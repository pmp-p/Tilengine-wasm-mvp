#!/bin/bash

export SDKROOT=${SDKROOT:-/opt/python-wasm-sdk}
export CONFIG=${CONFIG:-$SDKROOT/config}

. ${CONFIG}

PACKAGE=tilengine


echo "

    * building ${PACKAGE} for ${CIVER}, PYBUILD=$PYBUILD => CPython${PYMAJOR}.${PYMINOR}
            PYBUILD=$PYBUILD
            EMFLAVOUR=$EMFLAVOUR
            SDKROOT=$SDKROOT
            SYS_PYTHON=${SYS_PYTHON}

" 1>&2


. ${SDKROOT}/wasm32-${WASM_FLAVOUR}-emscripten-shell.sh

emcmake cmake .

if emmake make
then
    # some samples fail
    echo "not yet"
else
    echo "some samples build probably failed"
fi

exit 0
