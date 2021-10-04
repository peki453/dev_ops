# DevOps Lab 14

## Stack components

- Grafana: providing dashboards;
- Prometheus operator: configuration of a Prometheus;
- Prometheus: monitoring and alerting;
- AlertManager: handling alerts from app;
- Prometheus node-exporter: handling metrics from NIX kernels;
- Prometheus adapter for Kubernetes metrics APIs: ability to customize metrics;
- Kube-state-metrics: generating metrics from Kubernetes API.


## Installation

Command `kubectl get po,sts,svc,pvc,cm` returns information about running pods...

```

> helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

"prometheus-community" has been added to your repositories

> helm repo update

Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "prometheus-community" chart repository
Update Complete. Happy Helming!

> helm install kube-prom-stack  prometheus-community/kube-prometheus-stack

NAME: kube-prom-stack
LAST DEPLOYED: Sun Oct 3 22:43:31 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running: kubectl --namespace default get pods -l "release=kube-prom-stack"

> helm install time-app ./time-app

NAME: devops-workflow
LAST DEPLOYED: Mon Oct 4 21:13:04 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace default svc -w devops-workflow'
  export SERVICE_IP=$(kubectl get svc --namespace default devops-workflow --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo http://$SERVICE_IP:5000

> kubectl get po,sts,svc,pvc,cm

NAME                                                         READY   STATUS     RESTARTS   AGE
pod/alertmanager-kube-prom-stack-kube-prome-alertmanager-0   2/2     Running    0          16m
pod/devops-workflow-0                                        0/1     Running    0          45s
pod/devops-workflow-1                                        0/1     Running    0          45s
pod/devops-workflow-2                                        0/1     Running    0          45s
pod/kube-prom-stack-grafana-7d4c6d6797-4s2hp                 2/2     Running    0          17m
pod/kube-prom-stack-kube-prome-operator-6855964479-5fjcm     1/1     Running    0          17m
pod/kube-prom-stack-kube-state-metrics-6476fcff99-d8t4d      1/1     Running    0          17m
pod/kube-prom-stack-prometheus-node-exporter-ql44v           1/1     Running    0          17m
pod/prometheus-kube-prom-stack-kube-prome-prometheus-0       2/2     Running    0          16m

NAME                                                                    READY   AGE
statefulset.apps/alertmanager-kube-prom-stack-kube-prome-alertmanager   1/1     11m
statefulset.apps/devops-workflow                                        0/3     53s
statefulset.apps/prometheus-kube-prom-stack-kube-prome-prometheus       1/1     11m

NAME                                               TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/alertmanager-operated                      ClusterIP      None             <none>        9093/TCP,9094/TCP,9094/UDP   11m
service/devops-workflow                            LoadBalancer   10.108.136.143   <pending>     5000:32742/TCP               53s
service/kube-prom-stack-grafana                    ClusterIP      10.111.228.8     <none>        80/TCP                       15m
service/kube-prom-stack-kube-prome-alertmanager    ClusterIP      10.103.7.222     <none>        9093/TCP                     15m
service/kube-prom-stack-kube-prome-operator        ClusterIP      10.106.35.51     <none>        443/TCP                      15m
service/kube-prom-stack-kube-prome-prometheus      ClusterIP      10.108.235.216   <none>        9090/TCP                     15m
service/kube-prom-stack-kube-state-metrics         ClusterIP      10.101.110.27    <none>        8080/TCP                     15m
service/kube-prom-stack-prometheus-node-exporter   ClusterIP      10.111.238.255   <none>        9100/TCP                     15m
service/kubernetes                                 ClusterIP      10.96.0.1        <none>        443/TCP                      49m
service/prometheus-operated                        ClusterIP      None             <none>        9090/TCP                     12m

NAME                                              STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/visits-devops-workflow-0    Bound    pvc-aa682d38-5d2d-4678-8718-6ffb0c96c7b1   256M       RWO            standard       28m
persistentvolumeclaim/visits-devops-workflow-1    Bound    pvc-db91b329-e1b8-401b-844d-78ad6dab37f1   256M       RWO            standard       28m
persistentvolumeclaim/visits-devops-workflow-2    Bound    pvc-a1c51d5d-3060-4eea-902e-d78c3ded85c3   256M       RWO            standard       28m

NAME                                                                     DATA   AGE
configmap/devops-workflow                                                1      53s
configmap/kube-prom-stack-grafana                                        1      15m
configmap/kube-prom-stack-grafana-config-dashboards                      1      15m
configmap/kube-prom-stack-grafana-test                                   1      15m
configmap/kube-prom-stack-kube-prome-alertmanager-overview               1      15m
configmap/kube-prom-stack-kube-prome-apiserver                           1      15m
configmap/kube-prom-stack-kube-prome-cluster-total                       1      15m
configmap/kube-prom-stack-kube-prome-controller-manager                  1      15m
configmap/kube-prom-stack-kube-prome-etcd                                1      15m
configmap/kube-prom-stack-kube-prome-grafana-datasource                  1      15m
configmap/kube-prom-stack-kube-prome-k8s-coredns                         1      15m
configmap/kube-prom-stack-kube-prome-k8s-resources-cluster               1      15m
configmap/kube-prom-stack-kube-prome-k8s-resources-namespace             1      15m
configmap/kube-prom-stack-kube-prome-k8s-resources-node                  1      15m
configmap/kube-prom-stack-kube-prome-k8s-resources-pod                   1      15m
configmap/kube-prom-stack-kube-prome-k8s-resources-workload              1      15m
configmap/kube-prom-stack-kube-prome-k8s-resources-workloads-namespace   1      15m
configmap/kube-prom-stack-kube-prome-kubelet                             1      15m
configmap/kube-prom-stack-kube-prome-namespace-by-pod                    1      15m
configmap/kube-prom-stack-kube-prome-namespace-by-workload               1      15m
configmap/kube-prom-stack-kube-prome-node-cluster-rsrc-use               1      15m
configmap/kube-prom-stack-kube-prome-node-rsrc-use                       1      15m
configmap/kube-prom-stack-kube-prome-nodes                               1      15m
configmap/kube-prom-stack-kube-prome-persistentvolumesusage              1      15m
configmap/kube-prom-stack-kube-prome-pod-total                           1      15m
configmap/kube-prom-stack-kube-prome-prometheus                          1      15m
configmap/kube-prom-stack-kube-prome-proxy                               1      15m
configmap/kube-prom-stack-kube-prome-scheduler                           1      15m
configmap/kube-prom-stack-kube-prome-statefulset                         1      15m
configmap/kube-prom-stack-kube-prome-workload-total                      1      15m
configmap/kube-root-ca.crt                                               1      49m
configmap/prometheus-kube-prom-stack-kube-prome-prometheus-rulefiles-0   28     12m

```


## Grafana

- **CPU consuming:** 0.2%
- **Memory consuming:** 80MB
- **Pod using more CPU:** `prometheus-kube-prom-stack-kube-prome-prometheus`
- **Pod using less CPU:** `alertmanager-kube-prom-stack-kube-prome-alertmanager`
- **Memory usage on my node:** 2.74GB
- **Number of pods:** 16
- **Number of containers:** 31
- **Pod using network more:** storage provisioner
- **Pod using network less:** core DNS
- **Alerts:** 10

