# k8s-on-premises
Com esse repositório é possível montar, do zero, um cluster kubernetes.
* ## Pré Requisitos:
    - 2 Host com linux ubuntu server 22.04 LTS e 2 CPU e 2 Gb de RAM para cada host.

# 0-hosts
Contém todos os scripts necessários para configurar um control plane e os workers.
    
* ## 0-hosts/1-all-hosts
    Contém os scripts que configuram as ferramentas necessárias para todos os hosts do cluster.

* ## 0-hosts/2-controlplane
    Contém os scripts que configuram o control plane do cluster.

* ## 0-hosts/3-worker
    Contém os scripts que configuram o worker do cluster.

# 1-kong-gateway
Contém todas as configurações necessárias para o kong gateway

# 2-storage-class
Contém todas as configurações necessárias para criar o Storage Class

# 3-prometheus-stack
Contém todas as configurações necessárias para configurar o prometheus e o grafana

# Material completo:
 https://medium.com/@davidcardoso01/kubernetes-criando-um-cluster-on-premises-a-partir-de-tr%C3%AAs-vms-1c9d705949f8
