# locale
# modify /etc/locale.gen
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
# modify /etc/locale.conf
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# time
# tzselect
ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# initramfs
# /etc/mkinitcpio.conf
# mkinitcpio -p linux
# assume no need to modify

# install boot loader
pacstrap -S intel-ucode
bootctl install

cat << EOF > /boot/loader/entries/arch.conf
title	Arch Linux
linux	/vmlinuz-linux
initrd  /intel-ucode.img
initrd	/initramfs-linux.img
options	root=/dev/sda2 rw
EOF

cat << EOF > /boot/loader/loader.conf
timeout	3
default	arch
EOF

# hostname
echo 'arch' > /etc/hostname

# internet
# ls /sys/class/net
# ip link
# TODO
# systemctl enabe dhcpcd@interface.service

# password
echo 'Enter Password for Root: '
passwd
# unmount
# umount -R /mnt
# reboot
