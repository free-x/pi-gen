#!/bin/bash -e

install -m 644 files/skextra.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
sed -i "s/RELEASE/${RELEASE}/g" "${ROOTFS_DIR}/etc/apt/sources.list.d/skextra.list"

on_chroot apt-key add - < files/nodesource.gpg.key

on_chroot << EOF
apt-get update
EOF
