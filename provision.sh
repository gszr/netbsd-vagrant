#!/bin/sh

NETBSD_PACKAGES=${NETBSD_PACKAGES:="zsh vim mercurial git-base htop"}

sudo pkgin -y update

if [ -z "$NETBSD_NO_PACKAGES" ]; then
  sudo pkgin -y install $NETBSD_PACKAGES
fi

# create dirs for build.sh
sudo mkdir -p /usr/tools /usr/obj

# assume the src tree is in /work/src
if [ -d "/work/src" ]; then
  sudo ln -s /work/src /usr/src
fi

sudo /sbin/chown vagrant /usr/src /usr/tools /usr/obj

# build.sh

# Env Var name                    flag
cat<<EOS | tee -a /home/vagrant/.profile
export MACHINE=amd64              # -m
export MAKEOBJDIRPREFIX=/usr/obj  # -M
export TOOLDIR=/usr/tools         # -T
export MKUNPRIVED=yes             # -U
export MAKEVERBOSE=0              # -N
export MAKECONF=/etc/mk.conf      # none
EOS

echo 'export PATH=$PATH:/sbin' | tee -a /home/vagrant/.profile

# TODO
# - support custom shell
# - it'd be nice to automatically populate the terminfo database,
# based on the host's TERM
