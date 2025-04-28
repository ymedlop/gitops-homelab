# Argo CD Cluster Management Repo

<mark>NOTE: We base our repository on this repository https://github.com/alexmt/argocd-core-cluster-management</mark>

The repository contains an opinionated directory structure that enables Kubernetes administrators to efficiently use of Argo CD to bootstrap and manage fleet of Kubernetes clusters.

## Overview

Argo CD is used by both application developers and cluster administrators. The latter use cases are slightly different from the former.
The main difference is that cluster administrators typically manage way more applications in multiple clusters and have to leverage more advanced techniques.
We've identified the following main use cases for cluster administrators:

* **Cluster Addons** - set of applications that have to be installed on every cluster.
* **Cluster Groups** - ability to split the clusters fleet into multiple groups and customize each group independently.

## Prerequisites

You will need to install the following tools to use the repository:

* [git](https://git-scm.com/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [kustomize](https://kubernetes-sigs.github.io/kustomize/installation/)

## Getting Started

### Cluster Addons

Installing a homogeneous set of applications into multiple Kubernetes clusters is the most common task cluster administrators need to solve. These applications are sometimes
referred to as "cluster addons" and might include things like ingress controllers, monitoring, logging, service meshes, etc. The implicit requirement is that each and every
application setting should be configured in Git - no manual configurations.

Time to check our deployment repository. As you can expect it contains deployment manifests of cluster addons. The manifests are located in `clusters/base` directory:

```
clusters/addons
├── argocd
├── cert-manager
└── ...
```

Each directory represents a single application. The typical recommendation to application developers is to leverage Argo CD and manually create Argo CD Application CR per directory.
This is perfectly fine if you need to manage a few applications but cluster administrators have to take care of dozens if not hundreds! Creating Argo CD applications manually is not an option.
Instead, we can GitOps Argo CD configuration and let it manage itself. As you could've noticed, one of the directories is called `argocd`. This directory contains Argo CD installation manifests.

### Cluster Groups

In real life, changes are rarely made to all clusters at the same time. Instead, clusters are grouped logically and changes are "promoted" from group to group. In the same way, we use directory structure conversion in the Git repository to represent individual applications, we can use the directory structure to represent cluster groups.

Let's take a look at the directory structure:
```
clusters/groups
└── <cloud-provider>
    └── <environment>
        └── <cluster>
            └── addons
                ├── <addons-1>
                └── <addons-2>
```

## Homelab

For my current homelab I will avoid the environment level because does it not have sense for me.
```
clusters/groups
└── on-prem
    └── in-cluster
        └── addons
            ├── argo
            └── argo-rollouts
            └── argocd
```

I going to use an Old Mac Mini to have a CICD Cluster to allow me to use and lear about the the whole Argo Project.

<img width="50%" height="50%" src="images/k8scicd01.jpg" style="display: block; margin: 0 auto" alt="CICD Cluster">