if ! pacman -Qi yaourt > /dev/null; then
	sudo tee -a /etc/pacman.conf >/dev/null  <<-EOF
	[archlinuxfr]
	SigLevel = Never
	Server = http://repo.archlinux.fr/$arch
	EOF
fi

sudo pacman -S --needed yaourt
