## Configurando as métricas do projeto

Iremos configurar as métricas da aplicação, o foco será em observar tráfico de requisições e o uso de recursos. Usaremos "prometheus" para gerenciar as métricas e o "grafana" para a visualização delas.

### Instalando as ferramentas com Helm

Usaremos o "helm" ferramenta de gestão de manifestos kubernetes para nos ajudar a subir as nossas ferramentas de gestão de métricas no cluster.

1) - Adicione o repositório do prometheus: 
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

2) - Instale a versão mais recente do prometheus:
```bash
helm install prometheus prometheus-community/prometheus --version 25.22.0
```

3) - Adicione o repositório do grafana:
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

4) - Instale a versão mais recente do grafana:
```bash
helm install grafana grafana/grafana --version 8.3.2
```

5) - Pegue a senha do grafana, exponha o serviço do grafana e teste se está funcionando corretamnete:
```bash
kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
kubectl port-forward svc/grafana 3000:80
```

### Configurando o grafana

Neste tópico configuraremos o grafana para monitorar o uso do nosso cluster. 

#### Conectando o prometheus e o grafana:

Para conectar o prometheus com o grafana, vá em `/connections/datasources/prometheus`, após isso clique no botão `Add new data source`, insira o endpoint/url do prometheus.

Para conseguir o endpoint através do kubectl basta:

```bash
kubectl get svc prometheus-server -o jsonpath='http://{.spec.clusterIP}:{.spec.ports[0].port}'
```

#### Adicionando uma Dashboard

Para adicionar uma nova dashboard, você pode fazer por si só, ou escolher uma dashboard do [Grafana Labs](https://grafana.com/grafana/dashboards). Para exemplo, usaremos o `Grafana Labs`. 

Para adicionar um novo Dashboard a partir de um arquivo pré-configurado ou pelo `Grafana Labs`, vá até `/dashboard/import` e adicione a URL ou arquivo de configuração. Neste projeto usarei 
```https://grafana.com/grafana/dashboards/315-kubernetes-cluster-monitoring-via-prometheus/```

Indique a fonte de dados adequada, no nosso caso "Prometheus". Pronto, basta ir em `/dashboards` e verificar. 

