# Payever DevOps test

## kubectl setup

```bash
aws eks --region eu-central-1 update-kubeconfig --name payever-eks-z44vlCmY
```

export GRAFANA_POD=$(kubectl get pods   --namespace default -l app.kubernetes.io/name=grafana -o jsonpath="{.items[0].metadata.name}")

kubectl port-forward --namespace default $GRAFANA_POD 3000
<!-- kubectl expose deployment grafana --type=LoadBalancer --port=3000 --target-port=3000 --protocol=TCP -->
kubectl port-forward service/grafana 3000
kubectl port-forward service/payeverdb-mariadb 3306
kubectl port-forward service/prometheus-alertmanager 80
kubectl port-forward service/prometheus-server 80




SET GLOBAL slow_query_log=1;
SET GLOBAL long_query_time=1.0;
SET GLOBAL log_slow_rate_limit=5;


create table testdata as select * from information_schema.columns;
insert into testdata select * from testdata;


apiVersion: v1
kind: ConfigMap
metadata:
  name: myconfig
data:
  grafana.ini: |-
    # Raw text of the file

<!-- TODO slow_query_log -->
log_output=TABLE
SELECT * FROM mysql.slow_log
