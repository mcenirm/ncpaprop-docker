#!/bin/bash
set -eu

./configure \
    PETSC_ARCH=arch-linux-c-$1 \
    --with-scalar-type=$1 \
    --with-fc=0 --with-debugging=0 --with-mpi=0 --download-f2cblaslapack=1
make PETSC_ARCH=arch-linux-c-$1 all
make PETSC_ARCH=arch-linux-c-$1 test
make clean
