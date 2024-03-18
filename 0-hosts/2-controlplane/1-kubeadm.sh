#!/bin/bash
IPADDR=$1
POD_CIDR=$2
NODENAME=$(hostname -s)
if [ -z "$IPADDR" ]; then
  echo -e "Usage: $0 <node-ip> <pod-cidr> \nExample: $0 192.168.0.203 100.100.0.0/16"
  exit 1
fi
if [ -z "$POD_CIDR" ]; then
  echo -e "Usage: $0 <node-ip> <pod-cidr> \nExample: $0 192.168.0.203 100.100.0.0/16"
  exit 1
fi
sudo kubeadm init --apiserver-advertise-address=$IPADDR  --apiserver-cert-extra-sans=$IPADDR  --pod-network-cidr=$POD_CIDR --node-name $NODENAME

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "########################################"
echo "###   kubeadm join command acima    ###"
echo "###   por favor salve esse comando  ###"
echo "###   para poder realizar a config  ###"
echo "###   dos demais nodes do cluster   ###"
echo "########################################"