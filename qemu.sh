#!/bin/sh

KERNEL=buildroot/output/images/bzImage
#KERNEL=/boot/vmlinuz-3.16.0-57-generic
ROOTFS=buildroot/output/images/rootfs.ext2
RAMSZ=128
#QEMU_EMULATOR=qemu-system-i386
QEMU_EMULATOR=qemu-system-x86_64

sudo $QEMU_EMULATOR \
    -kernel $KERNEL \
    -hda $ROOTFS \
    -boot c -m $RAMSZ \
    -localtime -no-reboot -net nic -net user \
    -enable-kvm \
    -monitor tcp:127.0.0.1:4444,server,nowait \
    -append "root=/dev/sda rw console=ttyAMA0 console=ttyS0" \
    -serial stdio \
	-nographic \
    -usb \
	-usbdevice host:0603:00F2
	# -usbdevice host:0951:1607 \ 

    #-usb \
# access the qemu monitor using telnet localhost 4444
# Copy modules into /lib/modules/<kernel-version>
# run depmod -a
