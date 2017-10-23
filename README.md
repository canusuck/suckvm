# Инструкция

После настройки первой части делай настройку виртуальной машины 

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
1) <имя вашей машины в виртуалбокс> .sh <- скрипт, который будет использоваться извне VM 
2) <имя вашей машины в виртуалбокс> .ps1 <- скрипт, который будет использоваться из внутренней установки VM. 

Далее открываем создавшийся файл <имя вашей машины в виртуалбокс> .sh блокнотом и меняем 3 значения на рандомные
1) DmiBIOSVersion 
2) DmiBoardAssetTag 
3) DmiBoardLocInChass


