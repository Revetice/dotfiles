#!/bin/bash

# make sure firmware is efi
ls /sys/firmware/efi/efivars

# assume locale need not to change
# assume keyboard layout need not to change
# assume internet is connected

# identify device
# lsblk

# show partition table
# parted /dev/sda print

# assume gpt partition table (UEFI)

parted /dev/sda mklabel gpt
# /boot 512MiB
parted /dev/sda mkpart ESP fat32 1MiB 513MiB
parted /dev/sda set 1 boot on
# / rest storage
parted /dev/sda mkpart primary ext4 513MiB 100%


# format file system
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# mount
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

# modify mirrorlist
# /etc/pacman.d/mirrorlist
echo 'Server = http://archlinux.cs.nctu.edu.tw/$repo/os/$arch' | cat - /etc/pacman.d/mirrorlist > temp && mv temp /etc/pacman.d/mirrorlist

# pacstrap /
pacstrap -i /mnt base base-devel

# gen fstab
genfstab -U /mnt > /mnt/etc/fstab

# change root
# arch-chroot /mnt /bin/bash

echo 'en_US.UTF-8 UTF-8' >> /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo 'LANG=en_US.UTF-8' > /mnt/etc/locale.conf

# time
# tzselect
ln -s /usr/share/zoneinfo/Asia/Taipei /mnt/etc/localtime

# initramfs
# /etc/mkinitcpio.conf
# mkinitcpio -p linux
# assume no need to modify

# install boot loader
arch-chroot /mnt pacman -S intel-ucode
arch-chroot /mnt bootctl install

cat << EOF > /mnt/boot/loader/entries/arch.conf
title	Arch Linux
linux	/vmlinuz-linux
initrd  /intel-ucode.img
initrd	/initramfs-linux.img
options	root=/dev/sda2 rw
EOF

cat << EOF > /mnt/boot/loader/loader.conf
timeout	3
default	arch
EOF

echo 'arch' > /mnt/etc/hostname

# internet
# ls /sys/class/net
# ip link
# TODO
# systemctl enabe dhcpcd@interface.service

echo 'Enter Password for Root: '
arch-chroot /mnt passwd
