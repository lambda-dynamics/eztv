cp $REPO/udevrule /etc/udev/rules.d/10-usbscript.rules
cp $REPO/usbdevinserted /usr/bin/

udevadm control --reload-rules
