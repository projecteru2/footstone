FROM golang:alpine

MAINTAINER CMGS <ilskdw@gmail.com>

RUN apk --no-cache update && \
    apk --no-cache add linux-headers libc-dev gcc git ruby ruby-dev libgit2 libgit2-dev alpine-sdk ruby-etc rpm dpkg && \
    gem install --no-ri --no-rdoc fpm

RUN mkdir -p $GOPATH/src/github.com/projecteru2

