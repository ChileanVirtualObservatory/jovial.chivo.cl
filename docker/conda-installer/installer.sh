#!/usr/bin/env bash
set -xe
USER_ID=$(stat -c "%u" $HOME)
CONDA_DIR=$HOME/.conda/
SUCCESS_FLAG=$CONDA_DIR/.jovial_install_successful
useradd -u $USER_ID /bin/bash $USER
if [ ! -f $SUCCESS_FLAG ]; then
	echo "Installing conda"
  su - $USER -c "/bin/bash /conda-installer.sh -f -b -p $CONDA_DIR"
fi
touch $SUCCESS_FLAG
echo 'Done'
