#!/bin/bash

#*******************************************************************************#
# This script install in your home the Theano assuming that the NVIDIA drivers 	#
# and CUDA SDK are installed in your system.					#
#										#
# More information about Caffe Framework can be found in 			#
# http://deeplearning.net/software/theano/index.html# 				#
#										#
#										#
#										#
# PS: To undo the installation, plase execute the command			#
# rm -rf ~/devel/caffe-env/caffe and delete the two variables defined in 	#
# your ~/.bashrc.								#
#*******************************************************************************#

# -- definição das variaveis
ENV_NAME=theano-env
HOME_DEV=$HOME/devel/$ENV_NAME
CUDA_PATH=/usr/local/cuda-7.0
CURRENT_DIR=$(pwd)

# -- cria o ambiente virtual
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon $ENV_NAME

# -- instala os requisistos para a instalação do theano
pip install ipython
pip install argparse
pip install pyparsing==1.5.7
pip install numpy
pip install scipy
pip install nose -I
pip install sphinx
pip install pydot

# -- instalação do theano
pip install Theano

# --configuração do theano
echo "[blas]
ldflags = -L$HOME/local/openblas/lib/ -lopenblas -lgfortran

[cuda]
root=$CUDA_PATH

[global]
device = gpu1
floatX=float32" > ~/.theanorc

# -- teste do theano
python $VENV_ROOT/$ENV_NAME/lib/python2.7/site-packages/theano/misc/check_blas.py

cd $CURRENT_DIR

