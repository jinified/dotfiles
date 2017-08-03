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
12. Password generator: diceware, xkcdpass
13. Cloud storage: [megasync](https://mega.nz/sync)
14. [Installing rust](https://www.rust-lang.org/en-US/install.html)
15. [FZF](https://github.com/junegunn/fzf#using-git)
16. Autojump around directories: [fasd](https://github.com/clvv/fasd)
17. Plain text accounting: [ledger](https://launchpad.net/~mbudde/+archive/ubuntu/ledger)


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

# [Increase Linux server speed with TCP BBR](https://www.cyberciti.biz/cloud-computing/increase-your-linux-server-internet-speed-with-tcp-bbr-congestion-control/)

```shell
alias tj="touch ~/Notes/journal/$(date +%d-%m-%Y).org && emacs ~/Notes/journal/$(date +%d-%m-%Y).org"
```
# Fuzzy Finder
1. [Ripgrep + FZF](http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/)
2. [Selecta](https://github.com/garybernhardt/selecta)

# Cloud Storage
1. [Mega.nz](https://mega.nz)
2. [Hubic](https://hubic.com/en)
3. [Degoo](https://degoo.com)

# Email providers
1. [Gmail](https://mail.google.com)
2. [Tutanota](https://tutanota.com)
3. [Protonmail](https://protonmail.com/)

# Aggregating information

## Note taking

1. [Google Keep](https://keep.google.com)
 - Quick note sync using google
2. Org-mode
 - Literate programming to reproduce research
 - Inline image
3. [Note taking script with selecta, ag, fzz](https://gist.github.com/mrnugget/ba36d70ee1afafa45222)
 - using vim with fuzzy-finder to navigate notes
4. Using bullet journal

## Wiki / Blog

1. [TiddlyWiki5](https://github.com/Jermolene/TiddlyWiki5)
2. [Gollum](https://github.com/gollum/gollum)
3. Using github pages

## Todo

1. [Dynalist](https://dynalist.io)

## More form of capturing

1. [Trello](https://trello.com)
2. [Riot chat](https://riot.im)
3. Telegram group with myself

## Ranking of data inputs

1. Email
2. Whatsapp messages
3. FB messages
4. Malaysia news
5. World news
6. Biz / Fin news

## Backup

1. Personal data (encrypted and to the cloud)
 - Pictures
 - Contacts
 - Documents
2. Work data
 - dotfiles
 - installed packages
 - disk images
 - notes
3. Secondary data
 - books
 - music
 - videos
