kubectl kustomize clusters\groups\on-prem\in-cluster --enable-helm --load-restrictor LoadRestrictionsNone | kubectl apply -f -

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"

ECHO kubectl port-forward svc/argocd-server -n argocd 8080:80