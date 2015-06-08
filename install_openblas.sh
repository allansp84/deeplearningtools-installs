#!/bin/bash

# -- definição das variaveis
PREFIX=$HOME/local

CURRENT_DIR=$(pwd)
DOWNLAOD_PACKAGES=/tmp/download

mkdir -p $DOWNLAOD_PACKAGES


cd $DOWNLAOD_PACKAGES

git clone git@github.com:xianyi/OpenBLAS openblas

cd openblas
make
make PREFIX=$PREFIX/openblas install


echo "
export BLAS=$PREFIX/lib/libopenblas.a
export LAPACK=$PREFIX/lib/libopenblas.a
export LD_LIBRARY_PATH=$PREFIX/lib:\$LD_LIBRARY_PATH
export INCLUDE=$PREFIX/include:\$LD_LIBRARY_PATH
" >> ~/.bashrc
source ~/.bashrc


cd $CURRENT_DIR


cd $DOWNLOAD_PACKAGES/giflib-4.1.6
./configure --prefix=$PREFIX_INSTALL/giflib-4.1.6
make && make install
make distclean


cd $DOWNLOAD_PACKAGES/libjpeg-turbo-1.2.1
./configure --prefix=$PREFIX_INSTALL/libjpeg-turbo-1.2.1
make && make install
make distclean


cd $DOWNLOAD_PACKAGES/libpng-1.2.52
./configure --enable-shared --prefix=$PREFIX_INSTALL/libpng-1.2.52
make && make install
make distclean


cd $DOWNLOAD_PACKAGES/tiff-3.9.5
./configure --enable-shared --with-pic --prefix=$PREFIX_INSTALL/tiff-3.9.5
make && make install
make distclean


cd $DOWNLOAD_PACKAGES/netpbm-10.35.95
./configure --prefix=$PREFIX_INSTALL/netpbm-10.35.95
make && make package
./installnetpbm

