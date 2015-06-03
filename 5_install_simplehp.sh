#!/bin/bash

#*******************************************************************************#
# This script install in your home the Simple-HP assuming that the NVIDIA 	#
# drivers and CUDA SDK are installed in your system.				#
#										#
# More information about Caffe Framework can be found in 			#
# https://github.com/allansp84/simple-hp 					#
#										#
#										#
#										#
# PS: To undo the installation, plase execute the command			#
# rm -rf ~/devel/simplehp-env/*.						#
#*******************************************************************************#

ENV_NAME=simplehp-env
HOME_DEV=$HOME/devel/$ENV_NAME
CURRENT_DIR=$(pwd)

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon $ENV_NAME

pip install ipython
pip install cython
pip install numpy
pip install scipy
pip install argparse
pip install SQLAlchemy
pip install sphinx
pip install nose -I

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
pip install bob.io.image
pip install bob.measure

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

## -- installing hyperopt
#PROJECT_DIR=$(pwd)

#git clone https://github.com/hyperopt/hyperopt.git hyperopt
#(cd hyperopt && python setup.py develop)
#(cd hyperopt && nosetests)

#git clone https://github.com/jaberg/pyautodiff.git pyautodiff
#(cd pyautodiff && python setup.py develop)
#(cd pyautodiff && nosetests)

#git clone https://github.com/giovanichiachia/hyperopt-convnet.git hyperopt-convnet
#(cd hyperopt-convnet && python setup.py develop)

#git clone git@github.com:allansp84/simple-hp.git simple-hp
#(cd simple-hp && python setup.py develop)
