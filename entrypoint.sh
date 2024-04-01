#! /bin/bash -e

readonly USER=nut
readonly GROUP=nut

set -xe

/sbin/upsdrvctl -u root start
/sbin/upsd
ls -al /run/nut
ls -al /var/run/nut
exec /sbin/upsmon -F
