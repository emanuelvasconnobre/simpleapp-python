# Cluster kubernetes

Cluster usado para gerenciar recursos de hardware de uma série de máquinas, chamadas também de "nodes". Decidi usar K3D para este exemplo.

## Subindo um cluster com K3D

```
k3d cluster create picpay-cluster --servers 3 --agents 2
```

Neste comando, descrevo o nome do cluster a ser criado, usando a tag `--servers` descrevo a quantidade de "nodes" será vinculado, usando a tag `--agents` descrevo a quantidade de "panels/masters" meu cluster terá. 

A versão da imagem do K3S utilizada pelo K3D na criação do cluster neste exemplo foi a `v1.27.4-k3s1`.

## Fazendo deploy da aplicação

Antes de fazermos o deploy da aplicação, será necessário criarmos um "configmap" que será um manifesto que guardará variáveis de ambiente da aplicação.

```
kubectl apply -f manifests/simpleapp-cm.yaml
```

Para fazer o deploy usaremos o "kubectl", cli usada para gerir um cluster kubernetes. Após configurado as variáveis de ambientes, aplicaremos o restantes dos manifestos, sendo eles um `deployment` e um `service`.

```
kubectl apply -f manifests/simpleapp.yaml
kubectl apply -f manifests/service.yaml
```

Pronto! Agora é só testar, para testar basta fazer um "port-forward" para poder acessar a api:

```
kubectl port-forward svc/simpleapp-service 8008:8008
```

Agora acesse `http://localhost:8008/health` e veja se está tudo funcionando.