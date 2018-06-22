#!/usr/bin/env bash
set -xe
CONDA_DIR=$HOME/.conda
adduser -u $JOVIAL_NOTEBOOK_USER_UID --shell /bin/bash --disabled-password --gecos "" $USER
su -p $USER -c "$CONDA_DIR/bin/jupyterhub-singleuser --ip=0.0.0.0 $JOVIAL_NOTEBOOK_EXTRA_ARGS"
