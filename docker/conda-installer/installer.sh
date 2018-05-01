#!/usr/bin/env bash
set -xe
USER_ID=$(stat -c "%u" $HOME)
CONDA_DIR=$HOME/.conda/
SUCCESS_FLAG=$CONDA_DIR/.jovial_install_successful
adduser -u $USER_ID -s /bin/bash -D -g "" $USER
if [ ! -f $SUCCESS_FLAG ]; then
	echo "Installing conda"
  if [ -d $CONDA_DIR ]; then
    echo "Conda detected, removing corrupted directory"
		rm -rf $CONDA_DIR
  fi
  su - $USER -c "/bin/bash /conda-installer.sh -f -b -p $CONDA_DIR"
  touch $SUCCESS_FLAG
fi
echo 'Installation Completed'
