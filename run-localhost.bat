kubectl kustomize clusters\groups\on-prem\dev\docker-desktop --enable-helm --load-restrictor LoadRestrictionsNone | kubectl apply -f -

kubectl -n argo get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"

kubectl port-forward svc/argocd-server -n argo 8080:80