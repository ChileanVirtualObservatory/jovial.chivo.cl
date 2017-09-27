#! /bin/bash
set -xe
if [ -z "$USER_ID" ]; then
	USER_ID=$(stat -c "%u" /home/$USER/)
fi
useradd -u $USER_ID -s $SHELL $USER
notebook_arg=""
if [ -n "${NOTEBOOK_DIR:+x}" ]
then
    notebook_arg="--notebook-dir=/home/$USER"
fi

echo nameserver 10.6.91.26 >> /etc/resolv.conf
export HOME=/home/$USER
export CONDA_DIR=/home/$USER/.conda/
export CONDA_ROOT=/home/$USER/.conda/
export PATH="${HOME}/.conda/bin:$PATH"

if [ ! -d "/home/$USER/.conda" ] && [ -n "$JPY_USER" ]
then
	su - $USER -c "/bin/bash /conda-installer.sh -f -b -p /home/$USER/.conda"
	su - $USER -c 'grep -q PATH=/home/$USER/.conda/bin:$PATH "/home/$USER/.bashrc" || echo "PATH=/home/$USER/.conda/bin:$PATH" >> /home/$USER/.bashrc '
	su - $USER -c "yes | /home/$USER/.conda/bin/pip install jupyterhub==0.8.0.b3 acalib"
	su -p - $USER -c "/home/$USER/.conda/bin/python -m ipykernel install --name=Jovial --user --display-name=Jovial"

fi
su -p - $USER -c "/home/$USER/.conda/bin/jupyterhub-singleuser --port=8888 --ip=0.0.0.0 --user=$JPY_USER --cookie-name=$JPY_COOKIE_NAME --base-url=$JPY_BASE_URL --hub-prefix=$JPY_HUB_PREFIX --hub-api-url=$JPY_HUB_API_URL --NotebookApp.iopub_data_rate_limit=1000000000 ${notebook_arg}"
