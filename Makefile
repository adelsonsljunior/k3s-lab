SHELL := /bin/bash

.PHONY: manifests

all: up env setup manifests

up:
	vagrant up

env:
	source env.sh

setup:
	./setup.sh

uninstall:
	helm uninstall -n metallb metallb
	helm uninstall -n traefik traefik
	helm uninstall -n kube-system sealed-secrets
	helm uninstall -n cnpg-system cnpg
	helm uninstall -n argocd argocd

manifests:
	./manifests.sh

stop:
	vagrant halt

destroy: kubeconfig.lab token
	vagrant destroy -f 
	rm -rf .vagrant 
	rm kubeconfig.lab token