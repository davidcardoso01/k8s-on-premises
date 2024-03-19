#!/bin/bash
helm uninstall kong -n kong
kubectl delete ns kong