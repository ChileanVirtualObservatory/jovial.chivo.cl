FROM jupyterhub/jupyterhub
RUN pip install jupyterhub-ldapauthenticator
RUN pip install git+https://github.com/jupyterhub/kubespawner
#ADD utils.py /opt/conda/lib/python3.5/site-packages/jupyterhub/utils.py
#ADD user.py /opt/conda/lib/python3.5/site-packages/jupyterhub/user.py
ADD ./jupyterhub_config.py /jupyterhub_config.py
