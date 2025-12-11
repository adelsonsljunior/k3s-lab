# k3s-lab

Ferramentas necessárias:
- VirtualBox
- Vagrant
- Helm
- Helmfile
- Hashicorp Vault CLI

## Setup do ambiente

Suba as VMs
~~~sh
vagrant up
~~~

Suba as aplicações do ambiente
~~~sh
helmfile init
helmfile apply
~~~

Exporte as envs
~~~sh
source env.sh
~~~

## Configuração do Hashicrop Vautl

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