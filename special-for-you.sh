#!/bin/bash
#
##################################################################################################################
#
# Информация к размышлению      :   Скрипт используется для слежки за вами, и последующего траха вас в анал
# По воопросам и предложениям   :   https://wwh-club.net/members/crowe.51568/
#
##################################################################################################################
#
#          НИЧЕГО НЕ МЕНЯЙТЕ В СКРИПТЕ НУ ТОЛЬКО ГДЕ РАЗРЕШЕНО ОНЛИ, А ТО СУКА БУДЕТЕ ВЫЕБАНЫ В ЖОПУ :)
#
##################################################################################################################
#
# update
echo -n "Ну че шэф)) Стартуем?)) (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "Ох.. Зря ты так, тикай из городу.."
		sudo apt autoremove && sudo apt update && sudo apt -y dist-upgrade;
else
		echo "окей шэф)) погнали"
		sudo apt autoremove && sudo apt update && sudo apt -y dist-upgrade;
fi

rm /tmp/virtual-box.deb

wget http://download.virtualbox.org/virtualbox/5.1.30/virtualbox-5.1_5.1.30-118389~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb

sudo dpkg -i /tmp/virtual-box.deb
#gdebi /tmp/code_1.5.3-1474533365_amd64.deb

rm /tmp/virtual-box.deb

sudo usermod -a -G vboxusers user

sudo apt install -y acpidump && sudo apt install -y python-dmidecode && sudo apt install -y libcdio-utils && sudo apt install -y mesa-utils
echo "user" > user.lst
echo "user" > computer.lst
wget https://download.sysinternals.com/files/VolumeId.zip
wget https://www.nirsoft.net/utils/devmanview-x64.zip
unzip VolumeId.zip
unzip devmanview-x64.zip

# update
echo -n "Шэф)) Кароче надо типо произвести настройку ВиртуалБокса, а потом только жать дальше )) А то все наебнется... (y/N)?"; read s
if [ "$s" != "y" ]; then
        echo "Патчим виртуальную машину"
	sudo python2.7 antivm.py;
else
		echo "Патчим виртуальную машину"
		sudo python2.7 antivm.py;
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


echo "################################################################"
echo "##############             B R O              ##################"
echo "##############    T V O Y A  M A C H I N A    ##################"
echo "##############       O F I C I A L N O        ##################"
echo "##############      P R O H A C H A N A       ##################"
echo "##############        ( P O C H T I )         ##################"
echo "################################################################"


