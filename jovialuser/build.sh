set -xe
docker build --rm -t 10.6.91.18:5000/jovial/jovialuser .
docker push 10.6.91.18:5000/jovial/jovialuser
