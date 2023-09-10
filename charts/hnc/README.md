# hnc

Hierarchical Namespace Controller (HNC).
Policies and delegated creation to Kubernetes namespaces.

## usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                | Description                                     | Value           |
| ------------------- | ----------------------------------------------- | --------------- |
| `kubeVersion`       | Override Kubernetes version                     | `""`            |
| `nameOverride`      | String to partially override common.names.name  | `""`            |
| `fullnameOverride`  | String to fully override common.names.fullname  | `""`            |
| `namespaceOverride` | String to fully override common.names.namespace | `""`            |
| `commonLabels`      | Labels to add to all deployed objects           | `{}`            |
| `commonAnnotations` | Annotations to add to all deployed objects      | `{}`            |
| `clusterDomain`     | Kubernetes cluster domain name                  | `cluster.local` |

### HNC parameters

| Name                          | Description                                                                                                                                | Value                                  |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------- |
| `architecture`                | Allowed values: standalone or replication                                                                                                  | `standalone`                           |
| `webhookServer.replicaCount`  | Number of replicas to deploy when architecture == replication                                                                              | `3`                                    |
| `excludedNamespaces`          | Addition excluded namespaces                                                                                                               | `[]`                                   |
| `hrq.enabled`                 | Enable Hierarchical Resource Quota                                                                                                         | `false`                                |
| `managedNamespaceLabels`      | Managed namespace labels                                                                                                                   | `[]`                                   |
| `managedNamespaceAnnotations` | Managed Namespace Annotations                                                                                                              | `[]`                                   |
| `certManager.enabled`         | Use Cert-Manager for webhook certs                                                                                                         | `false`                                |
| `certManager.issuerRef`       | Cert-Manager issuer to use for webhook certs (self signed cert used if not specified)                                                      | `{}`                                   |
| `image.registry`              | image registry                                                                                                                             | `gcr.io`                               |
| `image.repository`            | image repository                                                                                                                           | `k8s-staging-multitenancy/hnc-manager` |
| `image.tag`                   | image tag (immutable tags are recommended)                                                                                                 | `v1.1.0`                               |
| `image.digest`                | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                                   |
| `image.pullPolicy`            | image pull policy                                                                                                                          | `IfNotPresent`                         |
| `image.pullSecrets`           | image pull secrets                                                                                                                         | `[]`                                   |
| `resources.limits`            | The resources limits for the containers                                                                                                    | `{}`                                   |
| `resources.requests`          | The requested resources for the containers                                                                                                 | `{}`                                   |
| `podLabels`                   | Extra labels for pods                                                                                                                      | `{}`                                   |
| `podAnnotations`              | Annotations for pods                                                                                                                       | `{}`                                   |
| `podAffinityPreset`           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                        | `""`                                   |
| `podAntiAffinityPreset`       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                   | `soft`                                 |
| `nodeAffinityPreset.type`     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                  | `""`                                   |
| `nodeAffinityPreset.key`      | Node label key to match. Ignored if `affinity` is set                                                                                      | `""`                                   |
| `nodeAffinityPreset.values`   | Node label values to match. Ignored if `affinity` is set                                                                                   | `[]`                                   |
| `affinity`                    | Affinity for pods assignment                                                                                                               | `{}`                                   |
| `nodeSelector`                | Node labels for pods assignment                                                                                                            | `{}`                                   |

### Traffic Exposure Parameters

| Name                             | Description                                                                                            | Value   |
| -------------------------------- | ------------------------------------------------------------------------------------------------------ | ------- |
| `service.annotations`            | Additional custom annotations for service                                                              | `{}`    |
| `metrics.enabled`                | Enable the export of Prometheus metrics                                                                | `true`  |
| `metrics.serviceMonitor.enabled` | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) | `false` |
| `extraDeploy`                    | Array of extra objects to deploy with the release                                                      | `[]`    |
