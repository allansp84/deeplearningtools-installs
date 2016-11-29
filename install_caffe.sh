#!/bin/bash

#*******************************************************************************#
# This script install in your home the Caffe framework, assuming that the       #
# NVIDIA drivers and CUDA SDK are installed in your system.                     #
#                                                                               #
# More information about Caffe Framework can be found in                        #
# http://caffe.berkeleyvision.org/                                              #
#                                                                               #
#                                                                               #
# PS: To undo the installation, plase execute the command                       #
# rm -rf ~/devel/caffe-env/caffe and delete the two variables defined in        #
# your ~/.bashrc.                                                               #
#*******************************************************************************#

VENV_NAME=caffe-env
PROJECT_DIR=$HOME/devel/$VENV_NAME
PYTHONPATH=$PROJECT_DIR/caffe/python
CAFFE_ROOT=$PROJECT_DIR/caffe

if [ "$CUDA_ROOT" = "" ]; then
    CUDA_ROOT=/usr/local/cuda
    echo  "" >> ~/.bashrc
    echo "export CUDA_ROOT=/usr/local/cuda" >> ~/.bashrc
    echo "export PATH=\$CUDA_ROOT/bin:\$PATH" >> ~/.bashrc
    echo "export LD_LIBRARY_PATH=\$CUDA_ROOT/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
    echo  "" >> ~/.bashrc
    export CUDA_ROOT
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

echo "*** downloading the Caffe Framework ***"
cd $PROJECT_DIR
git clone https://github.com/BVLC/caffe.git caffe
cd caffe

echo "*** installing Python requirements ***"
pip install ipython
(cd python && for req in $(cat requirements.txt); do pip install $req; done)


echo "*** compiling Caffe ***"
cp Makefile.config.example Makefile.config
make all
make test

echo "*** configuring your ~/.bashrc ***"
echo "
export PYTHONPATH=$PYTHONPATH:\$PYTHONPATH
export CAFFE_ROOT=$CAFFE_ROOT" >> ~/.bashrc
source ~/.bashrc

echo "*** Testing Caffe ***"
(cd $CAFFE_ROOT/data/cifar10 && ./get_cifar10.sh)
(cd $CAFFE_ROOT && ./examples/cifar10/create_cifar10.sh)
(cd $CAFFE_ROOT && ./examples/cifar10/train_quick.sh)

