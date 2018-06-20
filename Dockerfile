FROM centos

MAINTAINER CMGS <ilskdw@gmail.com>

RUN yum -y update && \
    yum -y groupinstall "Development Tools" && \
    yum -y install NetworkManager epel-release sudo which wget ruby rubygems ruby-devel openssl-devel zlib-devel http-parser && \
    yum -y install libgit2 libgit2-devel && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers && \
    gem install fpm

ENV GOPATH /.go
ENV GOBIN /.go/bin
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
ENV GOVERSION 1.10.3
RUN wget https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz && \
    tar -C /usr/local -xvzf go$GOVERSION.linux-amd64.tar.gz && \
    rm -rf go$GOVERSION.linux-amd64.tar.gz && \
    mkdir -p $GOBIN $GOPATH/src/github.com/projecteru2 && \
    curl https://glide.sh/get | sh

