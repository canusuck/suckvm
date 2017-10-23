# Инструкция

После настройки первой части делай настройку виртуальной машины 

# Start install 

git https://github.com/canusuck/suckvm.git && cd suckvm && chmod +x special-for-you.sh && ./special-for-you.sh

# System

Motherboard:

- RAM: 4 GB
- Boot order: Floppy -- Убрать галочку
- Chipset - ICH9
- Poinitng Device: PS/2 (мышка)
- Extended Features ставим галку на Enable I/O APIC
- Hardware Clock in UTC Time --включить

Processor:
- CPU: 2 cores (recomended 4)

Acceleration:
- Paravirtualization interface: Legacy (не даем гипервизору добавить бит в cpuid)
- Enable VT-x/AMD-V (needed for x64)
- Enable Nested Paging

# Display
- GPU: 64 MB RAM (no acceleration)
- Extended Features (disable)

# Storage
- PIIX4
- Use host I/O cache
- Hard Disk -- IDE Primary master
- Normal VDI (Dynamic)

# Network
- NAT

HDD: 120 Gb (желательно 100+ чтоб избежать палева в тесте, контроллер SATA)
NIC: 1x Host-Only adapter (we don't want Internet connectivity right away or Windows may develop the idea of updating itself)
Pulse audio (а по хорошему надо ставить на вм VAC виртуал аудио кабл) (изменяем в ней битрейт  и кол-во динамиков) это нужно для подделки AudioFingerprint

# Далее нажимаем продолжить

Создается 2 сценария оболочки: 
1) <DmiSystemProduct> .sh <- скрипт, который будет использоваться извне VM 
2) <DmiSystemProduct> .ps1 <- скрипт, который будет использоваться из внутренней установки VM. 

Далее открываем создавшийся файл <имя вашей машины в виртуалбокс> .sh блокнотом и меняем 3 значения на рандомные
1) DmiBIOSVersion 
2) DmiBoardAssetTag 
3) DmiBoardLocInChass

sh <DmiSystemProduct> .sh <имя вашей машины в виртуалбокс> 

# Устанавливаем Windows

# Установка конфигурации и Антидетекта

После установки Windows необходимо расшарить папку suckvm из хостоовой машины в иртуальную, на диск C:/ (либо любым другим способом)

Итак, на установленной системе отключаем лишние службы:
1) Вырубаем Windows Defender
2) Вырубаем Windows Update
3) Вырубаем ASLR: Запускаем ASLR.key из папки suckvm/tools/
4) Вырубаем DEP : Запускаем DEP.bat из папки suckvm/tools/

Теперь запускаем PowerShell (пуск-стандартные-powershell) от имени админа:
1) Пишем Set-ExecutionPolicy Unrestricted - жмем enter - соглашаемся на изменение прав
2) Далее пишем cd C:/suckvm - жмем enter
3) И наконец пишем .\*.ps1 (вместо * пишем <DmiSystemProduct> .ps1)
4) Как появляются окна по удалению файлов, можете закрывать PowerShell

# Fix не вводить просто так 

dpkg -l | grep virtualbox

====

ii  virtualbox-5.1  5.1.8-111374~Debian~jessie amd64 Oracle VM VirtualBox
ii  virtualbox-dkms 5.1.6-dfsg-2 all           x86   virtualization solution - kernel module sources for dkms

====

sudo rmmod vboxpci vboxnetadp vboxnetflt vboxdrv
sudo apt-get purge virtualbox-dkms
sudo /sbin/vboxconfig

