1) Clone o repositório github.com/nopp/simpleapp-python:
  - Crie uma imagem Docker da aplicação desse repositório
  - Envie a imagem para o dockerhub
2) A partir da imagem criada, crie os seguintes yaml para subir a aplicação em Kubernetes:
  - Deployment(simpleapp.yaml)
  - Configmap(simpleapp-cm.yaml) com valor Code:PicPay2022
  - Utilizar o configmap(simpleapp-cm) como envFrom no deployment(simpleapp)
3) Suba um cluster kubernetes e faça o deploy dos yaml do item 2
4) Configure uma monitoração nesse cluster(via helm) utilizando:
  - Prometheus
  - Grafana(crie um dashboard para demonstração)
5) Configure uma stack de logs
6) Os logs da aplicação deployada devem ser enviados para a stack que você subiu no item 5 (mostre uma tela com a consulta desses logs)     
7) Bônus:
  - Suba uma stack de tracing com Jaeger (mostre uma aplicação enviando traces)
  - Se for subir um cluster Kubernetes gerenciado (EKS, GKE etc), faça utilizando o Terraform
