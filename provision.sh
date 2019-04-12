#!/bin/sh

sudo pkgin update

PACKAGES="zsh vim"

if [ -z "$NETBSD_UTILS" ]; then
  sudo pkgin -y install $PACKAGES
fi


