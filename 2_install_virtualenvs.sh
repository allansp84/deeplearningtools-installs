#!/bin/bash

#*******************************************************************************#
#										#
# This script creates virtual environments for three deep learning		#
# tool: Caffe, Theano, and Simple-HP. Basically, this script create two		#
# directory in your home that are: (1) ~/virtualenv where are  installed	#
# the python modules of a virtual environment. and (2) ~/devel where are	#
# create the directories associated to each one of the virtualenvs.		#
#										#
# PS: To undo the installation, plase delete the two variables defined in your	#
# ~/.bashrc execute the follow command:						#
# >> rm -rf ~/virtualenv && rm -rf ~/devel					#
#										#
# More information about virtualenvs can be found in 				#
# https://virtualenv.pypa.io/en/latest/ and 					#
# http://virtualenvwrapper.readthedocs.org/en/latest/ 				#
#										#
#*******************************************************************************#

CURRENT_DIR=$(pwd)
WORKON_HOME=$HOME/virtualenv
PROJECT_HOME=$HOME/devel

cd $HOME
mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

cp .bashrc .bashrc.bkp

echo "
export WORKON_HOME=$WORKON_HOME
export PROJECT_HOME=$PROJECT_HOME
" >> ~/.bashrc
source ~/.bashrc

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

mkproject theano-env
mkproject caffe-env
mkproject simplehp-env

cd $CURRENT_DIR

