# Gateway API

Gateway API is a family of Kubernetes resources that provide dynamic infrastructure provisioning and advanced traffic routing. While the traditional Ingress API is still supported (and not planned to be deprecated), the Gateway API provides a more expressive, role-oriented, and extensible way to manage service exposure.

K3s comes with Traefik v3, which includes optional support for the Gateway API. In order to enable Gateway API support, deploy a HelmChartConfig that sets providers.kubernetesGateway.enabled to true.

```
apiVersion: helm.cattle.io/v1
kind: HelmChartConfig
metadata:
  name: traefik
  namespace: kube-system
spec:
  valuesContent: |-
    providers:
      kubernetesGateway:
        enabled: true
```
