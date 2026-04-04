haveUsbCore=$(cat /etc/default/grub | grep "usbcore")
if ! [[ -n $haveUsbCore ]] then
	sudo rm /etc/udev/rules.d/10-joystick.rules &> /dev/null
	echo "ACTION==\"add\", ATTRS{idVendor}==\"2345\", ATTRS{idProduct}==\"e00b\", RUN+=\"/sbin/modprobe xpad\" RUN+=\"/bin/sh -c 'echo 2345 e00b > /sys/bus/usb/drivers/xpad/new_id'\"" \
		| sudo tee -a /etc/udev/rules.d/10-joystick.rules > /dev/null
	
	echo "blacklist hid_nintendo" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null
	
	sudo mv /etc/default/grub /etc/default/grub-old
	grubConfig=/etc/default/grub-old
	lineToReplace=$(cat $grubConfig | awk -F= '$1 == "GRUB_CMDLINE_LINUX_DEFAULT" {printf $0}')
	newLine="${lineToReplace:0:-1} usbcore.quirks=2345:e00b:i,057e:2009:i,2345:e02f:i,2345:e02d:i\""
	sudo cat $grubConfig | sed "s/$lineToReplace/$newLine/" > /etc/default/grub
	sudo mkinitcpio -P
	sudo grub-mkconfig -o /boot/grub/grub.cfg
else
	echo "ERROR: Your grub already have \"usbcore\" config into GRUB_CMDLINE_LINUX_DEFAULT, so the script may can kill your grub"
	echo "You can do this: \nAdd this 2345:e00b:i,057e:2009:i,2345:e02f:i,2345:e02d:i to your usbcore.quirks"
	echo "And execute:"
	echo "sudo rm /etc/udev/rules.d/10-joystick.rules &> /dev/null
echo "ACTION==\"add\", ATTRS{idVendor}==\"2345\", ATTRS{idProduct}==\"e00b\", RUN+=\"/sbin/modprobe xpad\" RUN+=\"/bin/sh -c 'echo 2345 e00b > /sys/bus/usb/drivers/xpad/new_id'\"" \
| sudo tee -a /etc/udev/rules.d/10-joystick.rules > /dev/null

echo "blacklist hid_nintendo" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg"
fi
