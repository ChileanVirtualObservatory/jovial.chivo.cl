FROM alpine:latest
RUN apk add --update bash && rm -rf /var/cache/apk/*
ADD Anaconda3-5.1.0-Linux-x86_64.sh /conda-installer.sh
ADD installer.sh /installer.sh
CMD ['/installer.sh']
