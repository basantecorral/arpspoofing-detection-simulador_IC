#!/bin/bash

sudo sysctl -w vm.max_map_count=262144

pwd
# Init SIEM
cd escenarios/escenario1 && docker-compose up -d
sleep 5

# Init Suricata IDS
cd ../../suricata/escenario1 && sh init.sh
# Init VMs IEC Simulator

#sh /home/mario/Documentos/TFM/VMs/modify_vm.sh
#sleep 1
#sh /home/mario/Documentos/TFM/VMs/init_vm.sh

#Redirect the traffic of the server and client through the switch
sudo docker exec iec104_client_es1 apt-get install net-tools traceroute
sudo docker exec iec104_server_es1 apt-get install net-tools traceroute
sudo docker exec --privileged iec104_client_es1 route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.150
sudo docker exec --privileged iec104_server_es1 route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.150
