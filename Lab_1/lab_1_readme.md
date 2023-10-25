University: [ITMO University](https://itmo.ru/ru/)
Faculty: [FICT](https://fict.itmo.ru)
Course: [Network programming](https://github.com/itmo-ict-faculty/network-programming)
Year: 2023/2024
Group: K34202
Author: Tikhonov Stepan Nikolaevich
Lab: Lab1
Date of create: 6.10.2023
Date of finished: 25.10.2023

---
## I - Подготовка ВМ на YandexCloud
На облачном сервисе `YandexCloud` была сконфигурирована виртуальная машина `Ubuntu 20.04`:

![рисунок1](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/VM.png)
![рисунок2](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/settings.png)

При создании на ВМ был загружен публичный SSH ключ, для дальнейшего подключения и работы с машиной.
![рисунок3](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ssh_conect.jpg)

Далее установлены обновления, а также `python-pip`,` ansible` и `OpenVPN-server-as` (`openvpn-as`).

`apt update`

`apt upgrade`

`apt install python3-pip`

`pip3 install ansible`

`apt install ca-certificates wget net-tools gnupg`

`wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -`

`echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list`

`apt update`

`apt install openvpn-as`

![рисунок4](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ansible.jpg)

Было решено выбрать **OpenVPN сервер**, чтобы настраивать его через графический интерфейс в браузере. 

![рисунок5](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ovpn.jpg)

Далее с помощью VirtualBox установлен `Mikrotik CHR`.

![рисунок6](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/chr.jpg)

После чего было настроено подключение между пк и `router-os` с помощью сетевого моста, также важно отметить, что было неразборчивый режим разрешал все.

![рисунок7](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/bridge.jpg)

Далее подключаемся через `winbox` к `router-os` и загружаем файл `ovpn`.

![рисунок8](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ros_files.jpg)

## II - соединение
Для успешного соединения был настроен **OVPN сервер**, был установлен режим `TCP-only` и отключен `TLS Control Channel Security`.

![рисунок9](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/tcp.jpg)
![рисунок10](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/tls.jpg)
![рисунок11](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/server_info.jpg)

Затем был создан пользователь с возможностью `Autologin` и создан профиль для него, после создания профиля автоматически скачался `ovpn` файл. 
Это файл был импортирован на микротик - из него сгенерированы сертификаты.

![рисунок12](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/user_prof.jpg)
![рисунок13](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ovpn_certif.jpg)

Далее был создан интерфейс `OVPN Client`, через который создается тоннель к серверу.

![рисунок14](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ovpn_settings.jpg)

Последним действием была проверка на работоспособность тоннеля.

![рисунок15](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ovpn_status.jpg)
![рисунок16](https://github.com/Stepan1709/itmo-ict-faculty-2023-TIKHONOV/blob/master/Lab_1/screens/ovpn_traffic.jpg)

## III - результаты
1) Создана и настроена ВМ на `YandexCloud`;
2) Через графический интерфейс настроен `OVPN сервер`;
3) Локально через `VirtualBox`+`WinBox` настроен `Mikrotik CHR`;
4) Создан `OpenVPN` туннель между `Router-os` и `OVPN server`.

