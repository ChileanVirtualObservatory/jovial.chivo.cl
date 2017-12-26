# Jovial

![Jovial](https://www.chivo.cl/media/service-images/jovial.jpg)

Jovial is a platform where a server of JupyterHub (an application that permits multiuser spawns of Jupyter notebooks) runs within a Kubernetes infrastructure. The users have a personal account and the notebooks spawn in pods of a single docker container where the users' files are attached by docker volume. The files are managed and mounted in the hosts by LustreFS.
