#!/bin/bash

#*******************************************************************************#
# This script install in your home the Simple-HP assuming that the NVIDIA       #
# drivers and CUDA SDK are installed in your system.                            #
#                                                                               #
# More information about Caffe Framework can be found in                        #
# https://github.com/allansp84/simple-hp                                        #
#                                                                               #
#                                                                               #
# PS: To undo the installation, plase execute the command                       #
# rm -rf ~/devel/simplehp-env/*.                                                #
#*******************************************************************************#

VENV_NAME=simplehp-env
PROJECT_DIR=$HOME/devel/$VENV_NAME
PREFIX_INSTALL=$HOME/local

if [ "$CUDA_ROOT" = "" ]; then
    CUDA_ROOT=/usr/local/cuda-7.0
    echo "" >> ~/.bashrc
    echo "export CUDA_ROOT=/usr/local/cuda" >> ~/.bashrc
    echo "export PATH=\$CUDA_ROOT/bin:\$PATH" >> ~/.bashrc
    echo "export LD_LIBRARY_PATH=\$CUDA_ROOT/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
    echo "" >> ~/.bashrc
    export $CUDA_ROOT
else
    echo "CUDA_ROOT: '$CUDA_ROOT'";
fi

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
else
    echo '/usr/share/virtualenvwrapper/virtualenvwrapper.sh Not Found!'
    exit 1;
fi

echo "*** creating virtualenv ***"
mkvirtualenv $VENV_NAME
mkdir -p $PROJECT_DIR

echo "*** installing Python requirements ***"
pip install ipython
pip install cython
pip install numpy
pip install scipy
pip install argparse
pip install SQLAlchemy
pip install sphinx
pip install nose -I
pip install pyparsing==1.5.7
pip install pydot

pip install Pillow
pip install pyzmq
pip install pymongo
pip install networkx
pip install six
pip install coverage
pip install scikit-learn
pip install matplotlib

pip install bob.extension
pip install bob.blitz
pip install bob.core
pip install bob.io.base
pip install bob.measure

pip install Theano

echo "*** configuring your ~/.theanorc ***"
echo "[blas]
ldflags = -L$PREFIX_INSTALL/openblas/lib/ -lopenblas -lgfortran

[cuda]
root=$CUDA_ROOT

[global]
device = gpu1
floatX=float32" > ~/.theanorc

cd $PROJECT_DIR

echo "*** installing hyperopt ***"
git clone https://github.com/hyperopt/hyperopt.git hyperopt
(cd hyperopt && python setup.py develop)

echo "*** installing pyautodiff ***"
git clone https://github.com/jaberg/pyautodiff.git pyautodiff
(cd pyautodiff && python setup.py develop)

echo "*** installing hyperopt-convnet ***"
git clone https://github.com/giovanichiachia/hyperopt-convnet.git hyperopt-convnet
(cd hyperopt-convnet && python setup.py develop)

echo "*** installing simple-hp ***"
git clone https://github.com/giovanichiachia/simple-hp.git simple-hp
(cd simple-hp && python setup.py develop)


