#!/bin/bash

set -e

echo "Deleting old cluster (if exists)..."
kind delete cluster --name voting-platform || true

echo "Creating cluster..."
kind create cluster \
  --name voting-platform \
  --config kubernetes/kind/kind-config.yaml

echo "Applying namespaces..."
kubectl apply -f kubernetes/namespaces/

echo "Cluster ready!"
kubectl get nodes
kubectl get namespaces
