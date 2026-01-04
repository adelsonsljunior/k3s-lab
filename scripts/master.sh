#!/bin/bash

apt-get update -y
apt-get install ufw curl -y

ufw allow 6443/tcp #apiserver
ufw allow from 10.42.0.0/16 to any #pods
ufw allow from 10.43.0.0/16 to any #services
ufw allow 80/tcp
ufw allow 443/tcp

curl -sfL https://get.k3s.io | \
    INSTALL_K3S_EXEC="--disable servicelb \
    --disable traefik \
    --node-ip 192.168.56.10 \
    --advertise-address 192.168.56.10 \
    --flannel-iface=eth1 \
    --tls-san 192.168.56.10" \
    sh -

kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/standard-install.yaml

cat /var/lib/rancher/k3s/server/node-token > /vagrant/token
cat /etc/rancher/k3s/k3s.yaml > /vagrant/kubeconfig.lab
sed -i 's/127\.0\.0\.1/192.168.56.10/g' /vagrant/kubeconfig.lab