FROM alpine:latest

MAINTAINER CMGS <ilskdw@gmail.com>


RUN apk --no-cache update && \
    apk --no-cache add linux-headers git ruby ruby-dev libgit2 libgit2-dev alpine-sdk ruby-etc rpm dpkg go go-tools && \
    gem install --no-ri --no-rdoc fpm

ENV GOPATH /.go
ENV GOBIN /.go/bin
ENV PATH $PATH:$GOPATH/bin
RUN mkdir -p $GOBIN $GOPATH/src/github.com/projecteru2 && \
    curl https://glide.sh/get | sh

