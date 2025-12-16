#!/bin/bash

set -e

helm repo add metallb https://metallb.github.io/metallb
helm repo add traefik https://traefik.github.io/charts
helm repo add hashicorp https://helm.releases.hashicorp.com

helm repo update

helm upgrade --install metallb metallb/metallb \
  --namespace metallb \
  --create-namespace \
  --version 0.15.3

helm upgrade --install traefik traefik/traefik \
  --namespace traefik \
  --create-namespace \
  --version 37.4.0 \
  -f values/traefik/values.yaml

helm upgrade --install vault hashicorp/vault \
  --namespace vault \
  --create-namespace \
  --version 0.31.0

helm upgrade --install vault-secrets-operator hashicorp/vault-secrets-operator \
  --namespace vault-secrets-operator \
  --create-namespace \
  --version 1.0.1
