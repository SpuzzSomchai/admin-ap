#!/bin/sh -x

exec >> /mnt/sda1/debian_armhf/var/log/user.log 2>&1
/mnt/sda1/debian_armhf/opt/flossware/bootup.sh /opt/flossware/startup.sh
