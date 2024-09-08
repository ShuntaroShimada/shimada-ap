#!/bin/bash

sudo mkdir /mnt/az-shimada-fileshare
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/azshimadastorage.cred" ]; then
    sudo bash -c 'echo "username=azshimadastorage" >> /etc/smbcredentials/azshimadastorage.cred'
    sudo bash -c 'echo "password=/nak6bhL3d+6jH+KNOwJiy+qUnQ9K6F/BTiLGhZNqq/k5cPAmmoJ9ydltMd0+15BlIP8Dg2+jz3l+AStTVlGBg==" >> /etc/smbcredentials/azshimadastorage.cred'
fi
sudo chmod 600 /etc/smbcredentials/azshimadastorage.cred

sudo bash -c 'echo "//azshimadastorage.file.core.windows.net/az-shimada-fileshare /mnt/az-shimada-fileshare cifs nofail,credentials=/etc/smbcredentials/azshimadastorage.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30" >> /etc/fstab'
sudo mount -t cifs //azshimadastorage.file.core.windows.net/az-shimada-fileshare /mnt/az-shimada-fileshare -o credentials=/etc/smbcredentials/azshimadastorage.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30
