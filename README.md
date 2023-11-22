# Argo CD Cluster Management Repo

The repository contains an opinionated directory structure that enables Kubernetes administrators to efficiently use of Argo CD to bootstrap and manage fleet of Kubernetes clusters.

We based our repo on https://github.com/alexmt/argocd-core-cluster-management


Get Initial Password
```
kubectl get secret  argocd-initial-admin-secret -n argocd
```

Kubectl port-forwarding can also be used to connect to the API server without exposing the service
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```