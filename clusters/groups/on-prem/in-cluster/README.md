# K3s Bare Metal Cluster

This homelab runs a lightweight bare-metal Kubernetes cluster built on **K3s**, with a Mac mini acting as the control plane, a UGREEN NAS providing shared storage, and Raspberry Pi workers extending compute capacity.

The initial setup was inspired by this guide: [Create a Kubernetes Cluster from Old Computers](https://askcloudarchitech.com/posts/tutorials/create-kubernetes-cluster-from-old-computers/).

<img width="1672" height="941" alt="Cluster architecture" src="https://github.com/user-attachments/assets/24a47c99-15f9-4bd7-bd10-6f62226bca95" />

## Architecture Overview

| Role | Hostname | Hardware | Purpose |
|---|---|---|---|
| Control plane | `k3s-gengar` | Mac mini Mid 2010, 8 GB RAM, 128 GB SSD | Runs Ubuntu Server LTS, K3s server, and cluster management services |
| Shared storage | UGREEN DXP4800 Plus | 2 x 4 TB HDD in RAID 1 | Provides resilient shared storage for the cluster |
| Worker nodes | `k3s-vaporeon`, `k3s-jolteon`, `k3s-flaeron`, `k3s-espeon`, `k3s-umbreon`, `k3s-leafeon` | Raspberry Pi 3 B+ | Run workloads scheduled by the K3s control plane |

## Control Plane

### `k3s-gengar`

The control plane runs on an old **Mac mini Mid 2010** with 8 GB of RAM and a 128 GB SSD. It uses **Ubuntu Server LTS** as the operating system and runs the K3s server responsible for cluster orchestration.

Because older Mac mini hardware can become noisy under sustained load, the node also runs [`mbpfan`](https://github.com/linux-on-mac/mbpfan) to improve fan behavior and reduce unnecessary noise.

## Storage

### UGREEN NAS

Shared storage is provided by a **UGREEN DXP4800 Plus** configured with **two 4 TB HDDs in RAID 1**. This setup prioritizes data redundancy over raw capacity and is suitable for persistent storage, backups, and shared volumes used by the cluster.

The NAS is used as the storage backbone for the homelab and can support NFS-based persistent volumes for Kubernetes workloads.

## Worker Nodes

### Raspberry Pi 3 B+

The compute layer is made up of six Raspberry Pi 3 B+ nodes:

- `k3s-vaporeon`
- `k3s-jolteon`
- `k3s-flaeron`
- `k3s-espeon`
- `k3s-umbreon`
- `k3s-leafeon`

These nodes join the cluster as workers and are intended to run containerized workloads managed from the control plane.

## Notes

- K3s was chosen for its lightweight footprint and suitability for low-power homelab hardware.
- The Mac mini centralizes cluster control while the Raspberry Pi nodes provide horizontally scalable compute capacity.
- The NAS adds persistent shared storage, which is essential for stateful applications and long-term homelab growth.
