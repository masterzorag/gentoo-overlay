#!/bin/bash
#
# autorun Oracle Guest Additions installer from iso

ret=`dmesg -k | grep VBOX`

if [ -n "$ret" ]
then
	echo " * check passed: running inside a guest! *"
else
	echo " * this system is NOT a VirtualBox guest! *" && exit 1
fi

cd /tmp

mkdir cdrom

mount -o loop virtualbox-guest-ng/VBoxGuestAdditions.iso /tmp/cdrom &> /dev/null

/tmp/cdrom/VBoxLinuxAdditions.run --nox11

# cleanup

umount /tmp/cdrom

rm -rf /tmp/cdrom

cd

exit 0
