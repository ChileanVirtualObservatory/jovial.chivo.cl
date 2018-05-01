#!/usr/bin/env bash
set -xe
USER_ID=$(stat -c "%u" $HOME)
CONDA_DIR=$HOME/.conda
SUCCESS_FLAG=$CONDA_DIR/.jovial_install_successful
adduser -u $USER_ID --shell /bin/bash --disabled-password --gecos "" $USER
if [ ! -f $SUCCESS_FLAG ]; then
	echo "Installing conda"
  if [ -d $CONDA_DIR ]; then
    echo "Conda detected, removing corrupted directory"
		rm -rf $CONDA_DIR
  fi
	su $USER -c "grep -q PATH=$CONDA_DIR/bin:$PATH $HOME/.bashrc || echo PATH=$CONDA_DIR/bin:$PATH >> $HOME/.bashrc"
	su $USER -c "/bin/bash /conda-installer.sh -f -b -p $CONDA_DIR"
	su $USER -c "yes | $CONDA_DIR/bin/pip install jupyterhub acalib"
	touch $SUCCESS_FLAG
fi
echo 'Installation Completed'
