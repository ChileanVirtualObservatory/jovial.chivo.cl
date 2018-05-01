#!/usr/bin/env bash
set -xe
CONDA_DIR=$HOME/.conda
su - $USER -c "$CONDA_DIR/bin/jupyterhub-singleuser --ip=0.0.0.0"
