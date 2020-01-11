#!/bin/sh

debdir=/mnt/sda1/debian_armhf

mkdir -p $debdir/proc $debdir/sys $debdir/dev $debdir/dev/pts $debdir/tmp

cat /etc/mtab > $debdir/etc/fstab

# ----------------------------------------------------------------------

#chmod -R 755 $debdir

chmod -R 700 $debdir/etc/ssh

rm -rf $debdir/run/screen/*

# ----------------------------------------------------------------------

mount -t devpts none  $debdir/dev/pts

mount -o bind   /proc $debdir/proc
mount -o bind   /sys  $debdir/sys
mount -o bind   /dev  $debdir/dev
mount -o bind   /tmp  $debdir/tmp

mkdir -p $debdir/mnt/cloud-ap

mount -o bind / $debdir/mnt/cloud-ap

# ----------------------------------------------------------------------

/bin/busybox chroot $debdir $*

exit $?

