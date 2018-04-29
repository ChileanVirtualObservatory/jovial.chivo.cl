set -xe
docker build --rm -t 10.6.91.15:5000/jovial/jovialuser .
docker push 10.6.91.15:5000/jovial/jovialuser
