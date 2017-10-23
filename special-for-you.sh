#!/bin/bash
#
##################################################################################################################
# Vce  napisano dlya togo chtob yzat na 64 bitnix sistema, no eto ne tochno
# Avtor 			: 	crowe
# Link na avtora	: 	https://wwh-club.net/members/crowe.51568/
##################################################################################################################
##################################################################################################################
#
#   NICHEGOL NE MENYYTE V SKRIPTE, POMNITE CHTO YA MOGY VIEBAT VAS V ZOPY
#
##################################################################################################################

# update
echo -n "Pain, da Pain, tot chto s wwh-club, znay ti yebok (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "Pain ti vce ravno yebok hot i nazal net"
		sudo apt-get autoremove && sudo apt-get update && sudo apt-get -y dist-upgrade;
else
		echo "Ya tak i znal chto ti yebok"
		sudo apt-get autoremove && sudo apt-get update && sudo apt-get -y dist-upgrade;
fi

rm /tmp/virtual-box.deb

#wget http://download.virtualbox.org/virtualbox/5.1.12/virtualbox-5.1_5.1.12-112440~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb
#wget http://download.virtualbox.org/virtualbox/5.1.14/virtualbox-5.1_5.1.14-112924~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb
#wget http://download.virtualbox.org/virtualbox/5.1.24/virtualbox-5.1_5.1.24-117012~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb
wget http://download.virtualbox.org/virtualbox/5.2.0/virtualbox-5.2_5.2.0-118431~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb
sudo dpkg -i /tmp/virtual-box.deb
#gdebi /tmp/code_1.5.3-1474533365_amd64.deb

rm /tmp/virtual-box.deb

sudo apt-get install -y acpidump
sudo apt-get install -y libcdio-utils
sudo apt-get install -y python-dmidecode
sudo apt-get install -y git
git clone https://github.com/nsmfoo/antivmdetection.git
cd antivmdetection
echo "user" > user.lst
echo "user" > computer.lst
wget https://download.sysinternals.com/files/VolumeId.zip
wget https://www.nirsoft.net/utils/devmanview-x64.zip
unzip VolumeId.zip
unzip devmanview-x64.zip

# update
echo -n "Idi nastroy VM po gaidy potom nazimay (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "ne viebivaysya"
else
		echo "huy na"
fi

sudo python2.7 antivmdetect.py

# update
echo -n "Zaydi v papky antivmdetection i otredaktiryi tam skript posle redaktirovaniya i sohraneniya zmi (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "ne viebivaysya"
else
		echo "huy na"
fi



##################################################################################################################

echo "################################################################"
echo "##############    P A I N  T I  Y E B O K     ##################"
echo "################################################################"


