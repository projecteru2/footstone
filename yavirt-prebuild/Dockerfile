FROM ubuntu:16.04

ENV PATH=$PATH:/usr/local/go/bin

COPY init-yavirt-prebuild.sh init-libguestfs.sh /tmp/

RUN apt update \
  && apt install -y curl build-essential git libvirt-dev software-properties-common

RUN add-apt-repository ppa:git-core/ppa \
  && apt update \
  && apt install -y git \
  && git --version

RUN bash /tmp/init-yavirt-prebuild.sh
