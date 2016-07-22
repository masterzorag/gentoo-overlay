#!/bin/bash
#
# autorun Oracle Guest Additions installer from iso

ret=`dmesg -k | grep VBOX`

#echo $ret

if [ -n "$ret" ]
then
    echo "a guest"
else
    echo " * this system is NOT a VirtualBox guest! *" && exit 1
fi

cd /tmp

mkdir cdrom

mount -o loop virtualbox-guest-ng/VBoxGuestAdditions.iso /tmp/cdrom &> /dev/null

#chmod +x /tmp/cdrom/VBoxLinuxAdditions.run

/tmp/cdrom/VBoxLinuxAdditions.run --nox11 --noexec

# cleanup

umount /tmp/cdrom

rm -rf /tmp/cdrom

cd

exit 0