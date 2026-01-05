SHELL := /bin/bash

.PHONY: manifests

all: up env helm manifests

up:
	vagrant up

env:
	source env.sh

helm:
	ansible-playbook playbooks/helm.yaml

uninstall:
	helm uninstall -n metallb metallb
	helm uninstall -n traefik traefik
	helm uninstall -n kube-system sealed-secrets
	helm uninstall -n cnpg-system cnpg
	helm uninstall -n argocd argocd

manifests:
	ansible-playbook playbooks/manifests.yaml

passwd:
	@echo "ARGOCD:"
	@kubectl -n argocd get secret argocd-initial-admin-secret \
		-o jsonpath="{.data.password}" | base64 -d
	@echo -e "\nGRAFANA:"
	@kubectl get secret grafana \
		-o jsonpath="{.data.admin-password}" | base64 -d

stop:
	vagrant halt

destroy: kubeconfig.lab token
	vagrant destroy -f 
	rm -rf .vagrant 
	rm kubeconfig.lab token