#!/bin/bash
helm repo add kong https://charts.konghq.com
helm repo update
helm upgrade -i kong kong/kong -f 1-kong-gateway/kong-conf.yaml -n kong --create-namespace
kubectl apply -f 1-kong-gateway/KongPlugin.yaml