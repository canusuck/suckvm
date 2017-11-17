# Инструкция

После настройки первой части делай настройку виртуальной машины 

# 1. Start install 

git clone https://github.com/canusuck/suckvm.git && cd suckvm && chmod +x special-for-you.sh && ./special-for-you.sh

# 2. Настройка VM 

Создаем виртуальную Win7 (64bit)

Примечание. Не устанавливайте дополнительные компоненты или дополнения!!!

# Вкладка System

Motherboard:

- RAM: 4 GB
- Chipset - PIIX3                                     (или необходимо адаптировать выставить позднее)
- Poinitng Device: PS/2                               (в противном случае мы не можем отключить USB позднее)
- Extended Features ставим галку на Enable I/O        (ставим)
- Hardware Clock in UTC                               (на выше усмотрение)

Processor:
- CPU: 2 cores                                        (recomended 4)

Acceleration:
- Paravirtualization interface: Legacy                (это позволяет избежать обнаружения через CPUID)
- Включить - VT-x/AMD-V                               (needed for x64)
- Включить - Nested Paging                            (Позволяет управлять памятью хоста, что позволяет усилить производительность , т.к. не требуется программное управление памятью).

# Display
- GPU: 64 MB RAM - Убрать галочки с 2D, 3D акселерации
- Extended Features - Выключить

# Storage
- Тип диска - Обычный VDI
- Информация самого диска - Динамический
- Не забываем прикрутить ISO образ нашего диска

# Audio
Pulse audio (рекомендую использовать на виртуальной машине VAC - Virtual Audio Cable) (изменяем в ней битрейт и количество динамиков) - это нужно для подделки AudioFingerprint

# Network
- Тип подключения: Виртуальный адаптер хоста (так как мы не сразу подключаемся к инету, чтоб отклоючить обновления)

# COM-ports
- Выключить - последовательные порты

# USB
- Выключить - USB

- Остальные можно оставить по умолчанию...

# Важно
- Не забудьте сохраниться и закрыть окно VirtualBox

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
3) Вырубаем ASLR: [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management] - “MoveImages”=dword:00000000
4) Вырубаем DEP : bcdedit.exe /set {current} nx AlwaysOff

Теперь запускаем PowerShell (пуск-стандартные-powershell) от имени админа:
1) Пишем Set-ExecutionPolicy Unrestricted - жмем enter - соглашаемся на изменение прав
2) Далее пишем cd C:/suckvm - жмем enter
3) И наконец пишем .\<*>.ps1 (вместо * пишем <DmiSystemProduct> .ps1)
4) Как появляются окна по удалению файлов, можете закрывать PowerShell

# Fix не вводить просто так 

dpkg -l | grep virtualbox

====

ii  virtualbox-5.1  5.1.8-111374~Debian~jessie amd64 Oracle VM VirtualBox
ii  virtualbox-dkms 5.1.6-dfsg-2 all           x86   virtualization solution - kernel module sources for dkms

====

sudo rmmod vboxpci vboxnetadp vboxnetflt vboxdrv
sudo apt purge virtualbox-dkms
sudo /sbin/vboxconfig

