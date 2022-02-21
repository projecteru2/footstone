#!/bin/bash -eu

apt update
apt install -y apt-utils curl build-essential git make xz-utils pkg-config qemu qemu-kvm libvirt-dev \
  supermin gperf flex bison libncurses5-dev libpcre2-dev libpcre3-dev libaugeas-dev libmagic-dev libjansson-dev libhivex-dev ocaml libhivex-ocaml-dev genisoimage

WORK_DIR=$(pwd)

cd /tmp
#install libext2fs
curl -LOv http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.46.4.tar.gz
tar -xzf e2fsprogs-1.46.4.tar.gz
cd e2fsprogs-1.46.4
./configure
make && make install && make install-libs

cd "$WORK_DIR"
source init-libguestfs.sh

DYN_LIB_PATH=/usr/lib/x86_64-linux-gnu
cp /tmp/"${BASENAME}"/lib/.libs/"${DYN_LIB_FILE}" ${DYN_LIB_PATH}/
rm -f ${DYN_LIB_PATH}/libguestfs.so.0 ${DYN_LIB_PATH}/libguestfs.so
ln -s ${DYN_LIB_PATH}/"${DYN_LIB_FILE}" ${DYN_LIB_PATH}/libguestfs.so.0
ln -s ${DYN_LIB_PATH}/"${DYN_LIB_FILE}" ${DYN_LIB_PATH}/libguestfs.so

cp /tmp/"${BASENAME}"/include/guestfs.h /usr/include/
