#! /bin/bash
set -xe
USER_ID=$(stat -c "%u" /home/$USER/)
useradd -u $USER_ID -s $SHELL $USER
notebook_arg=""
if [ -n "${NOTEBOOK_DIR:+x}" ]
then
    notebook_arg="--notebook-dir=${NOTEBOOK_DIR}"
fi

export HOME=/home/$USER
export CONDA_DIR=/home/$USER/.conda/
export CONDA_ROOT=/home/$USER/.conda/
export PATH="${HOME}/.conda/bin:$PATH"

if [ ! -d "/home/$USER/.conda" ]
then
	su - $USER -c "/bin/bash /conda-installer.sh -f -b -p /home/$USER/.conda"
	su - $USER -c "/home/$USER/.conda/bin/conda config --system --set auto_update_conda false"
	su - $USER -c "/home/$USER/.conda/bin/conda  install  -y notebook jupyterlab ipython ipykernel python numpy qt astropy nomkl ipywidgets=6.0* pandas=0.19*  numexpr=2.6.* matplotlib=2.0* scipy=0.19* seaborn=0.7* scikit-learn=0.18* scikit-image=0.12* sympy=1.0* cython=0.25* patsy=0.4* statsmodels=0.8* cloudpickle=0.2* dill=0.2* numba=0.31* bokeh=0.12* sqlalchemy=1.1* hdf5=1.8.17 h5py=2.6* vincent=0.4.* beautifulsoup4=4.5.* xlrd"
	su - $USER -c "/home/$USER/.conda/bin/pip install jupyterhub==0.8.0.b3"
fi

su -p - $USER -c "/home/$USER/.conda/bin/python -m ipykernel install --name=Jovial --user --display-name=Jovial"
su -p - $USER -c "/home/$USER/.conda/bin/jupyterhub-singleuser --port=8888 --ip=0.0.0.0 --user=$JPY_USER --cookie-name=$JPY_COOKIE_NAME --base-url=$JPY_BASE_URL --hub-prefix=$JPY_HUB_PREFIX --hub-api-url=$JPY_HUB_API_URL --NotebookApp.iopub_data_rate_limit=1000000000 ${notebook_arg}"
