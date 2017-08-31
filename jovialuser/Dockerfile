FROM jupyterhub/singleuser:0.8
USER root
RUN apt-get update
RUN apt-get install -y openssh-client git
WORKDIR /opt
RUN userdel jovyan && rm -rf /home/jovyan
ENV SHELL /bin/bash
ADD jovialuser.sh /jovialuser.sh
RUN chmod +x /jovialuser.sh
ENTRYPOINT /jovialuser.sh
