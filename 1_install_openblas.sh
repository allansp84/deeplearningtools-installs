#!/bin/bash

# -- definição das variaveis
PREFIX=$HOME/local/openblas

CURRENT_DIR=$(pwd)
DOWNLAOD_PACKAGES=/tmp/download

mkdir -p $DOWNLAOD_PACKAGES


cd $DOWNLAOD_PACKAGES

git clone git@github.com:xianyi/OpenBLAS openblas

cd openblas
make
make PREFIX=$PREFIX install


echo "
export BLAS=$PREFIX/lib/libopenblas.a
export LAPACK=$PREFIX/lib/libopenblas.a
export LD_LIBRARY_PATH=$PREFIX/lib:\$LD_LIBRARY_PATH
export INCLUDE=$PREFIX/include:\$LD_LIBRARY_PATH
" >> ~/.bashrc
source ~/.bashrc


cd $CURRENT_DIR



