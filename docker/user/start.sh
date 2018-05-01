#!/usr/bin/env bash
set -xe
CONDA_DIR=$HOME/.conda
USER_ID=$(stat -c "%u" $HOME)
adduser -u $USER_ID --shell /bin/bash --disabled-password --gecos "" $USER
su -p $USER -c "$CONDA_DIR/bin/jupyterhub-singleuser --ip=0.0.0.0"
