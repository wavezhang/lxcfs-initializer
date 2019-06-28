#!/bin/bash

# Cleanup
nsenter -m/proc/1/ns/mnt fusermount -u /var/lib/lxcfs 2> /dev/null || true
nsenter -m/proc/1/ns/mnt [ -L /etc/mtab ] || \
        sed -i "/^lxcfs \/var\/lib\/lxcfs fuse.lxcfs/d" /etc/mtab

# Update lxcfs
cp -f /lxcfs/lxcfs /usr/local/bin/lxcfs
cp -f /lxcfs/liblxcfs.so /usr/local/lib/lxcfs/liblxcfs.so
cp -a /usr/lib64/libfuse.so* /usr/local/lib64/

# Prepare
mkdir -p /usr/local/lib/lxcfs /var/lib/lxcfs

# Mount
exec nsenter -m/proc/1/ns/mnt lxcfs /var/lib/lxcfs/
