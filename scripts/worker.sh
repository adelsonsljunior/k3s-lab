#!/bin/bash

echo "IP: ${NODE_IP}"

apt-get update -y
apt-get install ufw curl -y

ufw allow 6443/tcp #apiserver
ufw allow from 10.42.0.0/16 to any #pods
ufw allow from 10.43.0.0/16 to any #services
ufw allow 80/tcp
ufw allow 443/tcp

TOKEN=$(cat /vagrant/token)

curl -sfL https://get.k3s.io | \
    K3S_URL=https://192.168.56.10:6443 \
    K3S_TOKEN="$TOKEN" \
    INSTALL_K3S_EXEC="--node-ip ${NODE_IP} --flannel-iface=eth1" sh -