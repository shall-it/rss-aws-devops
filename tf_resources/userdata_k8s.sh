#!/bin/bash
dnf update -y
dnf install -y --allowerasing curl 
curl -Lo ./kops https://github.com/kubernetes/kops/releases/download/$(curl -s -L https://api.github.com/repos/kubernetes/kops/releases/latest  | jq -r .tag_name)/kops-linux-arm64
chmod +x ./kops
mv ./kops /usr/local/bin/kops
curl -Lo ./kubectl https://dl.k8s.io/release/$(curl -s -L https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
# kops deploy
export KOPS_STATE_STORE=${KOPS_STATE_STORE}
kops create cluster \
  --name ${NAME} \
  --cloud aws \
  --zones us-east-1a \
  --master-size t3.small \
  --node-size t3.small 
  --dns none \
  --yes
kops update cluster \
  --name ${NAME} \
  --yes \
  --admin
kops export kubecfg \
  --name ${NAME} \
  --kubeconfig=/home/ec2-user/.kube/config \
  --admin
chown ec2-user:ec2-user /home/ec2-user/.kube/config
chmod 600 /home/ec2-user/.kube/config
