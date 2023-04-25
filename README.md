# argocd-clusters-management

Get Initial Password
```
kubectl get secret  argocd-initial-admin-secret -n argocd
```

Kubectl port-forwarding can also be used to connect to the API server without exposing the service
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```