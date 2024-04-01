#! /bin/bash -e

readonly USER=nut
readonly GROUP=nut

set -xe

/sbin/upsdrvctl -u root start
/sbin/upsd
exec /sbin/upsmon -F
