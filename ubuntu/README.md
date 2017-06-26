# Packages
1. PDF Reader: zathura
2. File Manager: Nemo, Ranger
3. Window Manager: i3
4. PDF editor: pdftk
5. Automount: udiskie
6. Network Manager: nm-applet
7. [playerctl](https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb)
8. [megaFuse](https://github.com/matteoserva/MegaFuse)
9. Screenshot tool: xfce4-screenshooter
10. Screencast tool: SimpleScreenRecorder
11. ZSH style: [Zim](https://github.com/Eriner/zim)


# Enable bitmap fonts

cd /etc/fonts/conf.d/
sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
sudo dpkg-reconfigure fontconfig

# [Disable LightDM](https://askubuntu.com/questions/800239/how-to-disable-lightdmdisplay-manager-on-ubuntu-16-0-4-lts)

1. To boot to console
sudo systemctl set-default multi-user.target

2. Remove 'splash' from /etc/default/grub
sudo update-grub

3. To restore boot to GUI
sudo systemctl set-default graphical.target

# Prevent nemo file manager taking over desktop when using i3
gsettings set org.nemo.desktop show-desktop-icons false

# [Better font rendering with Infinality](http://www.webupd8.org/2013/06/better-font-rendering-in-linux-with.html)

# [Connect with MTP Device](http://www.debugpoint.com/2016/03/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/)
1. Use go-mtpfs ~/mnt to access the device

# [Changing Network interface to old style](http://www.itzgeek.com/how-tos/mini-howtos/change-default-network-name-ens33-to-old-eth0-on-ubuntu-16-04.html)

# How to disable touchscreen
1. [ArchWiki](https://unix.stackexchange.com/questions/127443/how-do-i-disable-the-touch-screen-on-my-laptop)
2. [UbuntuForum](https://ubuntuforums.org/showthread.php?t=2209083&highlight=disable+touchscreen)

# Open PGP

1. [Verifying OpenSSL certificate](https://blog.horan.hk/keyserver-howto.html)
2. [OpenPGP Best Practices](https://riseup.net/en/security/message-security/openpgp/best-practices)
