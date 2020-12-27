#!/bin/bash

sudo sysctl -w vm.max_map_count=262144

# Init SIEM
cd escenarios/escenario2 && docker-compose up -d

sleep 5

# Init Suricata IDS
cd ../../suricata/escenario2 && sh init.sh

# Init VMs IEC Simulator

#sh /home/mario/Documentos/TFM/VMs/modify_vm.sh
#sleep 1
#sh /home/mario/Documentos/TFM/VMs/init_vm.sh

sudo docker exec --privileged iec104_client_es1 route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.90
sudo docker exec --privileged iec104_server_es1 route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.90

