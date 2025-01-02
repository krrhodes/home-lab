#!/bin/bash

open -a Docker
until docker info > /dev/null 2>&1; do
  echo "Waiting for Docker to be ready..."
  sleep 1
done

k3d cluster create $CLUSTER_NAME -p "8081:80@loadbalancer" -p "8082:443@loadbalancer"

# TODO: Adopt Flux and convert helm install to declarative manifests
# Install cert-manager
helm repo add jetstack https://charts.jetstack.io --force-update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.16.2 \
  --set crds.enabled=true

# Install loki and promtail
helm repo add grafana https://grafana.github.io/helm-charts
helm install loki grafana/loki  \
  --namespace=loki \
  --create-namespace \
  --set loki.commonConfig.replication_factor=1 \
  --set deploymentMode=SingleBinary \
  --set singleBinary.replicas=1 \
  --set backend.replicas=0 \
  --set read.replicas=0 \
  --set write.replicas=0 \
  --set ingester.replicas=0 \
  --set querier.replicas=0 \
  --set queryFrontend.replicas=0 \
  --set queryScheduler.replicas=0 \
  --set distributor.replicas=0 \
  --set compactor.replicas=0 \
  --set indexGateway.replicas=0 \
  --set bloomCompactor.replicas=0 \
  --set bloomGateway.replicas=0 \
  --set loki.useTestSchema=true \
  --set loki.storage.type='filesystem' \
  --set loki.auth_enabled=false

helm install promtail grafana/promtail  \
  --namespace=loki \
  --create-namespace

kubectl apply -f 'manifests/**/namespace.yaml'
kubectl apply -f manifests/ --recursive

kubectl -n keycloak apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/26.0.7/kubernetes/keycloaks.k8s.keycloak.org-v1.yml
kubectl -n keycloak apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/26.0.7/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml
kubectl -n keycloak apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/26.0.7/kubernetes/kubernetes.yml

# Add all ingress route to /etc/hosts.
# TODO: Find a better way to do this, maybe a crd to do at runtime
echo "### Home Lab Configuration ###" | sudo tee -a /etc/hosts

find manifests -name "ingressRoute.yaml" -exec sed -nE "s/.*Host\(\`(.*)\`\).*/\1/p" {} \; | \
xargs -I % echo "127.0.0.1 %" | sudo tee -a /etc/hosts

echo "### End Lab Configuration ###" | sudo tee -a /etc/hosts