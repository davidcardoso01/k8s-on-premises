sudo kubeadm reset
sudo apt-get purge software-properties-common cri-o containernetworking-plugins kubeadm kubectl kubelet kubernetes-cni kube* 
sudo apt-get autoremove
sudo rm -rf ~/.kube
sudo rm -rf /etc/cni
sudo rm -rf /etc/kubernetes
sudo rm -rf /var/lib/etcd
sudo rm -rf /var/lib/kubelet
sudo rm -rf /opt/cni/
sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X