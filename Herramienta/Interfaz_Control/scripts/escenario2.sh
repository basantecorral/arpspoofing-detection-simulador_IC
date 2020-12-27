#!/bin/bash

sudo sysctl -w vm.max_map_count=262144

# Init SIEM
cd escenarios/escenario2 && docker-compose up -d

sleep 5

# Init Suricata IDS
cd ../../suricata/escenario2 && sh init.sh

#Redirect the traffic of the server and client through the switch
sudo docker exec modbus_master_es2 apt-get install net-tools traceroute
sudo docker exec modbus_slave_es2 apt-get install net-tools traceroute
sudo docker exec --privileged modbus_master_es2 route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.90
sudo docker exec --privileged modbus_slave_es2 route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.90

