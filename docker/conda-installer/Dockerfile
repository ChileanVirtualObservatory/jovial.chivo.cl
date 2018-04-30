FROM alpine:latest
RUN apk add --update bash && rm -rf /var/cache/apk/*
ADD Anaconda3-5.1.0-Linux-x86_64.sh /conda-installer.sh
ADD installer.sh /installer.sh
RUN echo nameserver 10.6.91.26 >> /etc/resolv.conf
ENTRYPOINT '/installer.sh'
