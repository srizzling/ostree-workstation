#!/usr/bin/env bash
set -xeuo pipefail


# NetworkManager config
cat <<EOF > /usr/lib/NetworkManager/conf.d/local.conf
[main]
plugins=
[device]
#wifi.backend=iwd
EOF

# systemd resolved
ln -sfn /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
ln -s ../systemd-resolved.service /usr/lib/systemd/system/multi-user.target.wants/systemd-resolved.service

mkdir -p /usr/lib/systemd/system/getty.target.wants
ln -s ../getty@.service /usr/lib/systemd/system/getty.target.wants/getty@tty1.service
