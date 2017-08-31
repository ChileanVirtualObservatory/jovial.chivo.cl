set -xe
docker build -t 10.6.91.18:5000/jupyterhub/systemuser .
docker push 10.6.91.18:5000/jupyterhub/systemuser
