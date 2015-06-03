#!/bin/bash

#*******************************************************************************#
# This script install in your home the Caffe framework, assuming that the 	#
# NVIDIA drivers and CUDA SDK are installed in your system.			#
#										#
# More information about Caffe Framework can be found in 			#
# http://caffe.berkeleyvision.org/ 						#
#										#
#										#
#										#
# PS: To undo the installation, plase execute the command			#
# rm -rf ~/devel/caffe-env/caffe and delete the two variables defined in 	#
# your ~/.bashrc.								#
#*******************************************************************************#


ENV_NAME=caffe-env
HOME_DEV=$HOME/devel/$ENV_NAME
CURRENT_DIR=$(pwd)

PYTHONPATH=$HOME_DEV/caffe/python
CAFFE_ROOT=$HOME_DEV/caffe

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon $ENV_NAME

cd $HOME_DEV
git clone git@github.com:BVLC/caffe.git caffe

cd caffe/python
for req in $(cat requirements.txt); do pip install $req; done

echo $HOME_DEV/caffe
cd $HOME_DEV/caffe
cp Makefile.config.example Makefile.config
# Adjust Makefile.config (for example, if using Anaconda Python)
make all
make test

echo "
export PYTHONPATH=$PYTHONPATH:\$PYTHONPATH
export CAFFE_ROOT=$CAFFE_ROOT" >> ~/.bashrc
source ~/.bashrc

# -- TESTING

# -- Prepare the Dataset
cd $CAFFE_ROOT/data/cifar10
./get_cifar10.sh
cd $CAFFE_ROOT
./examples/cifar10/create_cifar10.sh

# -- Training and Testing the 'Quick' Model
cd $CAFFE_ROOT
./examples/cifar10/train_quick.sh


cd $CURRENT_DIR

