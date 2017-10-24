#!/bin/bash
echo -n "Сейчас мы установим VirtualBox вы согласны (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "Процедура запущена"
		sudo apt-get autoremove && sudo apt-get update && sudo apt-get -y dist-upgrade;
else
		echo "Процедура запущена"
		sudo apt-get autoremove && sudo apt-get update && sudo apt-get -y dist-upgrade;
fi
rm /tmp/virtual-box.deb
wget http://download.virtualbox.org/virtualbox/5.2.0/virtualbox-5.2_5.2.0-118431~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb
sudo dpkg -i /tmp/virtual-box.deb
rm /tmp/virtual-box.deb

echo Ура все получилось, проверьте установлена ли программа.
