#!/bin/bash
IPINITIAL=$1
IPFINAL=$2
if [ -z "$IPINITIAL" ]; then
  echo -e "Usage: $0 <initial-ip> <final-ip> \nExample: $0 192.168.0.220 192.168.0.221"
    exit 1
fi
if [ -z "$IPFINAL" ]; then
  echo -e "Usage: $0 <initial-ip> <final-ip> \nExample: $0 192.168.0.220 192.168.0.221"
    exit 1
fi

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

helm repo add metallb https://metallb.github.io/metallb
helm repo update
helm upgrade -i metallb metallb/metallb -n metallb-system --create-namespace
sleep 30


cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
 name: first-pool
 namespace: metallb-system
spec:
 addresses:
 - $IPINITIAL-$IPFINAL
EOF

cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
 name: ltwo
 namespace: metallb-system
spec:
 ipAddressPools:
 - first-pool
EOF