#!/bin/bash

# Stop SIEM
cd escenarios/escenario3 && docker-compose stop 

# Stop Suricata IDS
cd ../../suricata/escenario3 && docker-compose stop 

# Stop VMs IEC Simulator

sh ~/Desktop/tfmMario/Simulador_IC/VMs/stop_vm.sh 