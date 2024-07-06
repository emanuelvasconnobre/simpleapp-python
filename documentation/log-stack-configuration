## Configurando uma stack de logs
Uma stack de logs serve para centrarlizar o recebimento, tratamento e gerência dos dados de logs das aplicações.

### Instalando o Grafana Loki

1) - Instale a versão mais recente do loki:
```bash
helm upgrade --install --values grafana/loki-overrides.yaml logging grafana/loki --version 6.6.5
```

2) - Instale a versão mais recente do grafana:
```bash
helm upgrade --install --values grafana/promtail-overrides.yaml promtail grafana/promtail --version 6.16.3
```

### Configurando o Grafana Loki

Para conectar o loki com o grafana, vá em `/connections/datasources/loki`, após isso clique no botão `Add new data source`, insira o endpoint/url, neste exemplo será `http://logging-loki-gateway.default.svc.cluster.local`. 

Para conseguir o endereço correto use de exemplo `http://<service-name>.<namespace>.svc.cluster.local`.

#### Adicionando uma Dashboard

Para adicionar uma nova dashboard, você pode fazer por si só, ou escolher uma dashboard do [Grafana Labs](https://grafana.com/grafana/dashboards). Para exemplo, usaremos o `Grafana Labs`. 

Para adicionar um novo Dashboard a partir de um arquivo pré-configurado ou pelo `Grafana Labs`, vá até `/dashboard/import` e adicione a URL ou arquivo de configuração. Neste projeto usarei 
```https://grafana.com/grafana/dashboards/15141-kubernetes-service-logs```

Indique a fonte de dados adequada, no nosso caso "Prometheus". Pronto, basta ir em `/dashboards` e verificar. 
