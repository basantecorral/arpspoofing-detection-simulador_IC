#!/bin/bash

# Down SIEM
cd escenarios/escenario3 && docker-compose down

sleep 5

# Down Suricata IDS
cd ../../suricata/escenario3 && docker-compose down

# Down VMs IEC Simulator

sh ~/Desktop/tfmMario/Simulador_IC/VMs/stop_vm.sh 
