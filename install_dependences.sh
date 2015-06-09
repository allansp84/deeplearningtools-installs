#!/bin/bash

#*******************************************************************************#
# This script install in your home the packages: Bison, OpenBLAS,               #
# Blitz, Boost, VLFeat, and Torch7                                              #
#                                                                               #
#                                                                               #
# PS: To undo the installation, plase execute the command rm -rf ~/local and    #
# delete the variables defined in your ~/.bashrc.                               #
#*******************************************************************************#



PREFIX_INSTALL=$HOME/local

DOWNLOAD_PACKAGES=/work/$USER/_recod_downloads_


echo "*** creating the directory $DOWNLOAD_PACKAGES ***"
mkdir -p $DOWNLOAD_PACKAGES


echo "*** downloading the packages ***"
cd $DOWNLOAD_PACKAGES

wget http://ftp.gnu.org/gnu/bison/bison-2.3.tar.gz
git clone git@github.com:xianyi/OpenBLAS openblas
wget http://ufpr.dl.sourceforge.net/project/blitz/blitz/Blitz%2B%2B%200.10/blitz-0.10.tar.gz
wget http://ufpr.dl.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.zip
wget http://www.vlfeat.org/download/vlfeat-0.9.20.tar.gz

tar -xzf $DOWNLOAD_PACKAGES/bison-2.3.tar.gz
tar -xzf $DOWNLOAD_PACKAGES/blitz-0.10.tar.gz
unzip $DOWNLOAD_PACKAGES/boost_1_55_0.zip
tar -xzf $DOWNLOAD_PACKAGES/vlfeat-0.9.20.tar.gz -C $PREFIX_INSTALL

echo "*** installing Bison package ***"
cd $DOWNLOAD_PACKAGES/bison-2.3
./configure --prefix=$PREFIX_INSTALL/bison-2.3
make && make install
make distclean


echo "*** installing OpenBLAS package ***"
cd $DOWNLOAD_PACKAGES/openblas
make
make PREFIX=$PREFIX_INSTALL/openblas install


echo "*** installing Blitz package ***"
cd $DOWNLOAD_PACKAGES/blitz-0.10
./configure --prefix=$PREFIX_INSTALL/blitz-0.10
make lib
make install
make distclean

echo "*** installing Boost package ***"
cd $DOWNLOAD_PACKAGES/boost_1_55_0
./bootstrap.sh
./b2 install --prefix=$PREFIX_INSTALL/boost_1_55_0
./b2 install threading=multi link=shared

echo "*** installing VLFeat package ***"
cd $PREFIX_INSTALL/vlfeat-0.9.20
make
mkdir lib
find -iname "libvl.so" -exec ln -s $(pwd)/{} lib/ \;


echo "*** installing Torch7 package ***"
cd $DOWNLOAD_PACKAGES
curl -s https://raw.githubusercontent.com/allansp84/ezinstall/master/install-luajit+torch | PREFIX=$PREFIX_INSTALL/torch bash


echo "*** configuring your ~/.bashrc ***"
echo "
PREFIX_INSTALL=$PREFIX_INSTALL

# Local Installs
# ==============
# This allows you to install programs into \$PREFIX_INSTALL/someprogram
# for example, when I install node locally I install it like this:
#
#    ./configure --PREFIX=\$PREFIX_INSTALL/node-v0.8.4
#    make
#    make install
#
# To uninstall a program, just rm -rf \$PREFIX_INSTALL/someprogram
#
if [ -d \$PREFIX_INSTALL ]; then
    for i in \$PREFIX_INSTALL/* \$PREFIX_INSTALL/`uname -m`/*; do
        [ -d \$i/bin ] && PATH="\${i}/bin:\${PATH}"
        [ -d \$i/sbin ] && PATH="\${i}/sbin:\${PATH}"
        [ -d \$i/include ] && CPATH="\${i}/include:\${CPATH}"
        [ -d \$i/include ] && INCLUDE="\${i}/include:\${INCLUDE}"
        [ -d \$i/lib ] && LIBDIR="\${i}/lib:\${LIBDIR}"
        [ -d \$i/lib ] && LD_RUN_PATH="\${i}/lib:\${LD_RUN_PATH}"
        [ -d \$i/lib ] && LD_LIBRARY_PATH="\${i}/lib:\${LD_LIBRARY_PATH}"
        [ -d \$i/lib64 ] && LD_LIBRARY_PATH="\${i}/lib:\${LD_LIBRARY_PATH}"
        [ -d \$i/libexec ] && LD_LIBRARY_PATH="\${i}/lib:\${LD_LIBRARY_PATH}"
        # uncomment the following if you use macintosh
        #  [ -d \$i/lib ] && DYLD_LIBRARY_PATH="\${i}/lib:\${DYLD_LIBRARY_PATH}"
        [ -d \$i/lib/pkgconfig ] && PKG_CONFIG_PATH="\${i}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
        [ -d \$i/share/man ] && MANPATH="\${i}/share/man:\${MANPATH}"
    done
    export PATH
    export CPATH
    export INCLUDE
    export LIBDIR
    export LD_RUN_PATH
    export LD_LIBRARY_PATH
    export PKG_CONFIG_PATH
    export MANPATH
fi

export BLAS=\$PREFIX_INSTALL/openblas/lib/libopenblas.a
export LAPACK=\$PREFIX_INSTALL/openblas/lib/libopenblas.a" >> ~/.bashrc

echo "*** Finished ***"

