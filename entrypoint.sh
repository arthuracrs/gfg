#!/bin/bash 

./heartbeat setup

chown root heartbeat.yml
./heartbeat -e