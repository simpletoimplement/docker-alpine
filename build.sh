#!/bin/sh

chmod +x ./alpine-make-rootfs/alpine-make-rootfs
sudo ./alpine-make-rootfs/alpine-make-rootfs --branch edge --timezone 'Europe/Tallinn' --script-chroot --packages 'apk-tools tzdata bash curl su-exec>=0.2 ca-certificates' rootfs.tar.gz || exit

