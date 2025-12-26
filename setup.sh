#!/bin/bash

set -e

helm repo add metallb https://metallb.github.io/metallb
helm repo add traefik https://traefik.github.io/charts
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo add cnpg https://cloudnative-pg.github.io/charts
helm repo add argo https://argoproj.github.io/argo-helm

helm repo update

helm upgrade --install metallb metallb/metallb \
  --namespace metallb \
  --create-namespace \
  --version 0.15.3

helm upgrade --install traefik traefik/traefik \
  --namespace traefik \
  --create-namespace \
  --version 37.4.0 \
  --values values/traefik/values.yaml

helm upgrade --install sealed-secrets sealed-secrets/sealed-secrets \
  --namespace kube-system \
  --set-string fullnameOverride=sealed-secrets-controller 

helm upgrade --install cnpg \
  --namespace cnpg-system \
  --create-namespace \
  cnpg/cloudnative-pg

helm upgrade --install argocd argo/argo-cd \
  --namespace argocd \
  --create-namespace \
  --version 9.2.2 \
  --values values/argocd/values.yaml