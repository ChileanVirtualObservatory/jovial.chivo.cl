FROM jupyterhub/singleuser:0.8
USER root
RUN sed -i 's@http://archive.ubuntu.com/ubuntu/@http://mirrors.cloud.linets.cl/ubuntu@g' /etc/apt/sources.list && \
    sed -i 's@http://security.ubuntu.com/ubuntu/@http://mirrors.cloud.linets.cl/ubuntu@g' /etc/apt/sources.list
RUN apt update && apt install -y build-essential openssh-client git curl vim emacs nano wget \
    && rm -rf /var/lib/apt/lists/*
RUN userdel jovyan && rm -rf /home/jovyan
ADD start.sh /start.sh
WORKDIR '/home'
ENTRYPOINT '/start.sh'
