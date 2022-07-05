FROM alpine3.16

MAINTAINER CMGS <ilskdw@gmail.com>

RUN apk --no-cache add sudo \
    && adduser -h /home/lambda -u 65530 -D lambda \
    && echo 'lambda ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

