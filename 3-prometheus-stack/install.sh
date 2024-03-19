#!/bin/bash
kubectl apply -f 3-prometheus-stack/storage/persistent-volume.yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm update
helm upgrade -i prometheus prometheus-community/kube-prometheus-stack -f 3-prometheus-stack/prometheus-conf.yaml --namespace monitoring --create-namespace
