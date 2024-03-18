#!/bin/bash
echo "###############################################"
echo "### Execute esse comando no control plane ####"
echo "### ou em outra maquina que tenha o       ####"
echo "### kubectl configurado.                   ####"
echo "###############################################"

if [ -z $1 ]; then
  echo -e "Usage: $0 <node-name> \nExample: $0 worker1"
  exit 1
fi

kubectl label node $1 node-role.kubernetes.io/worker=worker