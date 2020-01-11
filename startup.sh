#!/bin/bash

# ------------------------------------------------------

swapon /mnt/swap

# ------------------------------------------------------

chmod 777 /dev/shm

chmod 666 /dev/tty*

chmod u+s /usr/bin/sudo
chmod g+s /usr/bin/sudo

chmod 777 /run/screen

chmod 700 -R /etc/ssh /var/run/sshd

# ------------------------------------------------------
# Elasticsearch settings...
# ------------------------------------------------------

sysctl vm.max_map_count=262144
ulimit -n 65535

# ------------------------------------------------------

/usr/sbin/ntpdate-debian

/etc/init.d/ntp               start
/etc/init.d/rsyslog           start
/etc/init.d/cron              start
/etc/init.d/rpcbind           start
/etc/init.d/nfs-common        start
/etc/init.d/nfs-kernel-server start
/etc/init.d/postfix           start
#/etc/init.d/nis               start
/etc/init.d/ssh               start
/etc/init.d/rsync             start

# ------------------------------------------------------

/etc/init.d/mysql             start
/etc/init.d/postgresql        start

#/opt/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch.pid -d

# ------------------------------------------------------

mount -a

# ------------------------------------------------------

mkdir -p /mnt/admin-ap/etc
mkdir -p /mnt/admin-ap/home
mkdir -p /mnt/admin-ap/backups
mkdir -p /mnt/admin-ap/media
mkdir -p /mnt/admin-ap/nas
mkdir -p /mnt/admin-ap/shared
mkdir -p /mnt/admin-ap/root

mkdir -p /mnt/bedroom-ap

mount admin-ap:/etc           /mnt/admin-ap/etc
mount admin-ap:/home          /mnt/admin-ap/home
mount admin-ap:/opt/backups   /mnt/admin-ap/backups
mount admin-ap:/opt/media     /mnt/admin-ap/media
mount admin-ap:/opt/nas       /mnt/admin-ap/nas
mount admin-ap:/opt/shared    /mnt/admin-ap/shared
mount admin-ap:/root          /mnt/admin-ap/root

mount bedroom-ap:/tmp/mnt/sda1/debian_armel/mnt  /mnt/bedroom-ap

# ------------------------------------------------------

