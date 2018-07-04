FROM jupyterhub/jupyterhub:0.8.1
RUN pip install git+https://github.com/ChileanVirtualObservatory/ldapauthenticator.git
RUN pip install git+https://github.com/jupyterhub/kubespawner
RUN apt update && apt install -y build-essential python3-dev libmysqlclient-dev && rm -rvf /var/lib/apt/lists/*
RUN pip install mysqlclient