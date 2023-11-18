# 2023-11-10 17:03:25 by RouterOS 7.11.2
# software id = 
#
/interface bridge
add name=loopback
/interface ovpn-client
add certificate=profile-6776518810172554087.ovpn_1 cipher=aes256-cbc \
    connect-to=158.160.24.170 mac-address=02:19:67:36:34:BF name=ovpn-out1 \
    port=443 user=mikrotik
/disk
set slot1 slot=slot1 type=hardware
set slot2 slot=slot2 type=hardware
set slot3 slot=slot3 type=hardware
set slot4 slot=slot4 type=hardware
set slot5 slot=slot5 type=hardware
set slot6 slot=slot6 type=hardware
set slot7 slot=slot7 type=hardware
set slot8 slot=slot8 type=hardware
set slot9 slot=slot9 type=hardware
set slot10 slot=slot10 type=hardware
set slot11 slot=slot11 type=hardware
set slot12 slot=slot12 type=hardware
set slot13 slot=slot13 type=hardware
set slot14 slot=slot14 type=hardware
set slot15 slot=slot15 type=hardware
set slot16 slot=slot16 type=hardware
set slot17 slot=slot17 type=hardware
set slot18 slot=slot18 type=hardware
set slot19 slot=slot19 type=hardware
set slot20 slot=slot20 type=hardware
set slot21 slot=slot21 type=hardware
set slot22 slot=slot22 type=hardware
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing id
add disabled=no id=172.16.0.1 name=OSPF_ID select-dynamic-id=""
add disabled=no id=172.16.0.1 name=OSPF_ID select-dynamic-id=""
/routing ospf instance
add disabled=no name=ospf-1 originate-default=always router-id=OSPF_ID
/routing ospf area
add disabled=no instance=ospf-1 name=backbone
/ip address
add address=172.16.0.1 interface=loopback network=172.16.0.1
/ip dhcp-client
add interface=ether1
/routing ospf interface-template
add area=backbone auth=md5 auth-key=admin disabled=no interfaces=ether1
/system note
set show-at-login=no
/system ntp client
set enabled=yes
/system ntp client servers
add address=0.ru.pool.ntp.org
