#!/bin/bash

sudo apt-get update -y
sudo apt-get install ufw curl -y

ufw allow 6443/tcp #apiserver
ufw allow from 10.42.0.0/16 to any #pods
ufw allow from 10.43.0.0/16 to any #services

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip 192.168.56.10 --tls-san 192.168.56.10" sh -