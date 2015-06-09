#!/bin/bash

#*******************************************************************************#
# This script install in your home the Theano assuming that the NVIDIA drivers  #
# and CUDA SDK are installed in your system.                                    #
#                                                                               #
# More information about Caffe Framework can be found in                        #
# http://deeplearning.net/software/theano/index.html#                           #
#                                                                               #
#                                                                               #
# PS: To undo the installation, plase execute the command                       #
# rm -rf ~/devel/caffe-env/caffe and delete the two variables defined in        #
# your ~/.bashrc.                                                               #
#*******************************************************************************#

VENV_NAME=theano-env
PROJECT_DIR=$HOME/devel/$VENV_NAME
PREFIX_INSTALL=$HOME/local

PYTHONPATH=$PROJECT_DIR/caffe/python
CAFFE_ROOT=$PROJECT_DIR/caffe

if [ "$CUDA_ROOT" = "" ]; then
    CUDA_ROOT=/usr/local/cuda-7.0
    echo  "" >> ~/.bashrc
    echo "export CUDA_ROOT=/usr/local/cuda" >> ~/.bashrc
    echo "export PATH=\$CUDA_ROOT/bin:\$PATH" >> ~/.bashrc
    echo "export LD_LIBRARY_PATH=\$CUDA_ROOT/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
    echo  "" >> ~/.bashrc
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
pip install argparse
pip install pyparsing==1.5.7
pip install numpy
pip install scipy
pip install nose -I
pip install sphinx
pip install pydot

echo "*** installing Theano ***"
pip install Theano

echo "*** configuring your ~/.theanorc ***"
echo "[blas]
ldflags = -L$PREFIX_INSTALL/openblas/lib/ -lopenblas -lgfortran

[cuda]
root=$CUDA_ROOT

[global]
device = gpu1
floatX=float32" > ~/.theanorc

