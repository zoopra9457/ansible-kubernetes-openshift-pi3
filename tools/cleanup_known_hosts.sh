#!/bin/sh

ssh-keygen -R pi-master
ssh-keygen -R 192.168.1.200
ssh-keyscan -H pi-master >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.1.200 >> ~/.ssh/known_hosts

for i in 1 2 3
do
  echo "Cleaning up pi-node-0${i}"
  ssh-keygen -R pi-node-0${i}
  ssh-keygen -R 192.168.1.20${i}
  ssh-keyscan -H pi-node-0${i} >> ~/.ssh/known_hosts
  ssh-keyscan -H 192.168.1.20${i} >> ~/.ssh/known_hosts
done
