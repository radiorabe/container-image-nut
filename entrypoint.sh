#! /bin/bash -e

readonly USER=nut
readonly GROUP=nut

set -xe

if [[ -d "/var/tmp/nut-config" ]]; then
  cp /var/tmp/nut-config/* /etc/nut/
fi

/sbin/upsdrvctl -u root start
/sbin/upsd
ls -al /run/nut
ls -al /var/run/nut
exec /sbin/upsmon -F
