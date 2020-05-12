#!/bin/bash -eux

##
## Misc configuration
##

echo '> Disable IPv6'
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf

echo '> Removing unnecessary packages...'
tdnf remove -y docker

echo '> Applying latest Updates...'
tdnf -y update

echo '> Installing Additional Packages...'
tdnf install -y \
  logrotate \
  wget \
  unzip \
  awk \
  tar \
  perl

echo '>Allow .local DNS lookups...'
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

echo '> Done'
