## Backup installed packages
pacman -Qqe | grep -v "$(pacman -Qmq)" > pkglist

## Restore installed packages
pacman -S $(cat pkglist)

