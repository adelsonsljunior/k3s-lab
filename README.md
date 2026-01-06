# k3s-lab

Ferramentas necessárias:
- Make
- VirtualBox
- Vagrant
- Kubectl
- Helm
- Ansible
- Hashicorp Vault CLI

## Setup do ambiente

Suba o laboratório
~~~sh
make
~~~

Configure os hosts
~~~sh
sudo cat hosts >> /etc/hosts
~~~

Obter senhas das aplicações
~~~sh
make passwd
~~~

## Configuração do Hashicrop Vault

Faça o port-forward do Vault
~~~sh
kubectl port-forward -n vault svc/vault 8200:8200 
~~~

Realize o processo de unseal do Vault
~~~sh
vault operator init
vault operator unseal
vault operator unseal
vault operator unseal
vault login
~~~

## Informações úteis

Lista das VMs
node|address|
---|---|
master|192.168.56.10|
worker1|192.168.56.21|
worker2|192.168.56.22|

Hosts
~~~
192.168.56.30   traefik.lab.local
192.168.56.30   argocd.lab.local
192.168.56.30   s3.lab.local
192.168.56.30 	grafana.lab.local
~~~
