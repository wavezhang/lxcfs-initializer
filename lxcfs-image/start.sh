#!/bin/sh

umount_fs() {
    nsenter -m/proc/1/ns/mnt umount /var/lib/lxcfs 2>/dev/null
}

exit_umount_fs() {
    echo "umount host /var/lib/lxcfs, then exit"
    umount_fs
}

umount_fs

trap exit_umount_fs SIGTERM SIGKILL SIGINT

/lxcfs/lxcfs /var/lib/lxcfs &

wait $!
