#!/bin/bash

set -e

until kubectl apply -f manifests/metallb/load-balancer.yaml; do
    sleep 10;
    kubectl delete validatingwebhookconfigurations metallb-webhook-configuration;
done