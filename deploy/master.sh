#!/bin/bash

set -o errexit

API_SERVER_CFG=/etc/kubernetes/manifests/kube-apiserver.yaml 

echo "Updating api server params..."
if ! grep "admission-control=.*,Initializers" $API_SERVER_CFG; then
  sed -i "s/--admission-control=.*/&,Initializers/g" $API_SERVER_CFG
fi

if ! grep "admissionregistration.k8s.io/v1alpha1=true" $API_SERVER_CFG; then
  sed -i "/- kube-apiserver/a\\    - --runtime-config=admissionregistration.k8s.io\/v1alpha1=true" $API_SERVER_CFG
fi
