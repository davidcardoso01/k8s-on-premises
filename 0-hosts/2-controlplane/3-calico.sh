#!/bin/bash
POD_CIDR=$1
if [ -z "$POD_CIDR"]
then
  echo -e "Usage: $0 <pod-cidr> \nExample: $0 100.100.0.0/16"
  exit 1
fi

helm repo add projectcalico https://docs.tigera.io/calico/charts
helm repo update
cat <<EOF | helm upgrade -i calico projectcalico/tigera-operator --version v3.27.2 --namespace tigera-operator --create-namespace -f -
installation:
  calicoNetwork:
    ipPools:
    - cidr: $POD_CIDR
      encapsulation: VXLANCrossSubnet
EOF