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
echo -n "Вы хотите запустить процедуру уджаления неиспользуемых пакетов и обновления системы (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "Процедура запущена"
		sudo apt-get autoremove && sudo apt-get update && sudo apt-get -y dist-upgrade;
else
		echo "Процедура запущена"
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

sudo usermod -a -G vboxusers user

sudo apt-get install -y acpidump python-dmidecode libcdio-utils cd-drive hdparm lspci smartctl git
echo "user" > user.lst
echo "user" > computer.lst
wget https://download.sysinternals.com/files/VolumeId.zip
wget https://www.nirsoft.net/utils/devmanview-x64.zip
unzip VolumeId.zip
unzip devmanview-x64.zip

# update
echo -n "Произведи настройку виртуальной машины в VirtualBox, не забудь сохраниться, после чего нажимай продолжить (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "Патчим виртуальную машину"
	sudo python3 antivm.py;
else
		echo "Патчим виртуальную машину"
		sudo python3 antivm.py;
fi

echo Сейчас выполняй настройку созданого файла Сценария оболочки <DmiSystemProduct>.sh (он создастся в папке) 
echo Этот скрипт, который будет использоваться на линуксе, перед стартом VM
echo 1) DmiBIOSVersion
echo 2) DmiBoardAssetTag
echo 3) DmiBoardLocInChass
echo можешь поменять значения этих параметров
echo так же посмотри размер своего файла по DSDT только измени данные если что там юзера и имя машины параметры под 1 2 3 пока не троогай спроси меня 
echo ls -l /sys/firmware/acpi/tables/ | grep DSDT
echo 1) sudo cp /sys/firmware/acpi/tables/DSDT /home/user/VirtualBox\ VMs/Win71/DSDT
echo 2) sudo chown user:user /home/user/VirtualBox\ VMs/Win71/DSDT
echo 3) VBoxManage setextradata Win71 VBoxInternal/Devices/acpi/0/Config/CustomTable /home/user/VirtualBox\ VMs/Win71/DSDT

echo если все номалек то запускай через bash <DmiSystemProduct>.sh имямашины


##################################################################################################################

echo "################################################################"
echo "##############           P A I N              ##################"
echo "##############    T V O Y A  M A C H I N A    ##################"
echo "##############       O F I C I A L N O        ##################"
echo "##############      P R O H A C H A N A       ##################"
echo "################################################################"


