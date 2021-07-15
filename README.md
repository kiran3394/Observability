## Metrics and Logging Pipeline for a application deployed on Kubernetes (minikube) 

#### Technology Stack deployed on Minikube are as follows: (Used helm-charts)

###### Sample SpringBoot application
- Build jar - `gradlew clean build`
- Run `eval $(minikube docker-env)`
- create docker image of application using Dockerfile - `docker build -t test-image .`
- Run `docker run -d -p 8080:80 --name test-image test-image`
- Run `docker commit <container_id> test-image:v1`
- Create deployment - `kubectl create deployment test-image --image=test-image:v1`
- Expose service - `kubectl expose deployment test-image --type=LoadBalancer --port=80`

###### Metrics
- Install Prometheus
  - `helm install prometheus stable/prometheus -f values_prometheus.yaml`
- Install Grafana
  - `helm install grafana stable/grafana -f values_grafana.yaml`

###### Logging
- Install Elasticsearch
  - `helm repo add elastic https://helm.elastic.co`
  - `helm repo update`
  - `helm search hub elasticsearch`
  - `helm install elasticsearch elastic/elasticsearch -f values_elastic.yaml`
- Install Filebeat
  - `helm install filebeat elastic/filebeat`
- Install Kibana
  - `helm install kibana elastic/kibana`

#### Output Screenshots

![alt text](https://github.com/kiran3394/Observability/blob/master/results_screenshots/few%20metrics.png?raw=true)

![alt text](https://github.com/kiran3394/Observability/blob/master/results_screenshots/logs_from_elasticsearch.png?raw=true)



