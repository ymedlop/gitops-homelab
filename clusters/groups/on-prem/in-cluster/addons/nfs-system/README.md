# NFS setup between k3s-gengar and the NAS

This document describes the current NFS layout used by the homelab Kubernetes cluster and the reason for limiting NAS write access to the control-plane node `k3s-gengar`.

## Current architecture

The NAS is a UGREEN device reachable at `192.168.1.xx`, and the Kubernetes control-plane node is `k3s-gengar` at `192.168.1.xx`. The validated NFS export path is `/volume1/k3shomelab`, and it was successfully mounted from `k3s-gengar` using NFS version 3.

The cluster is managed with k3s and Argo CD, and persistent volumes are intended to be created through `nfs-subdir-external-provisioner`, which is a common pattern for adding dynamic NFS-backed storage to k3s.

## NFS configuration

The NAS side must expose the shared folder as an NFS export and explicitly authorize the client IP address or subnet that is allowed to mount it. On UGREEN systems, NFS access is configured on shared folders, and the export must be visible to the client before Kubernetes can use it reliably.

The working manual mount command is shown below:

```bash
sudo mount -t nfs -o nfsvers=3 192.168.1.xx:/volume1/k3shomelab /mnt/ugreen
```

A successful manual mount confirms three things at once: the NAS export path is correct, the client IP is authorized, and the Linux node has the required NFS client support to consume the share.

## Why only gengar keeps NAS access

Restricting NAS write access to `k3s-gengar` simplifies the security model because the NAS only needs to trust one Kubernetes node instead of the whole worker pool. This reduces configuration sprawl on the NAS and makes NFS permissions easier to reason about in a small homelab.

This design also fits the intended deployment model where the NFS provisioner is scheduled only on `k3s-gengar`. In that model, the provisioner is the component that talks to the NAS to create PVC-backed subdirectories, so the NAS only needs to authorize the node running that component.

The trade-off is that dynamic volume provisioning becomes tied to that node. Existing workloads can continue using already-mounted storage, but creating new NFS-backed persistent volumes depends on `k3s-gengar` remaining available.

## Operational notes

When deploying the provisioner through Argo CD, the chart should use the validated server and path values: `192.168.1.xx` and `/volume1/k3shomelab`. If the deployment is pinned to `k3s-gengar` with a node selector or node affinity rule, the NAS can remain restricted to that single node IP.

This approach is a sensible balance for a homelab: simple permissions, predictable storage behavior, and GitOps-managed configuration through Argo CD.
