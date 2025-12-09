#!/bin/bash

cat /etc/rancher/k3s/k3s.yaml > /vagrant/kubeconfig.lab
sed -i 's/127\.0\.0\.1/192.168.56.10/g' /vagrant/kubeconfig.lab