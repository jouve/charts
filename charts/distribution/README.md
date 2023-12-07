# distribution

## usage

```console
helm repo add jouve https://jouve.github.io/charts/
helm install mailpit jouve/distribution
```

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Distribution parameters

| Name                                              | Description                                                                                                                                | Value                       |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------- |
| `image.registry`                                  | image registry                                                                                                                             | `docker.io`                 |
| `image.repository`                                | image repository                                                                                                                           | `distribution/distribution` |
| `image.tag`                                       | image tag (immutable tags are recommended)                                                                                                 | `2.8.3`                     |
| `image.digest`                                    | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                        |
| `image.pullPolicy`                                | image pull policy                                                                                                                          | `IfNotPresent`              |
| `image.pullSecrets`                               | image pull secrets                                                                                                                         | `[]`                        |
| `configYml`                                       | Registry config.yml                                                                                                                        | `{}`                        |
| `persistence.enabled`                             | Enable persistence using Persistent Volume Claims                                                                                          | `true`                      |
| `persistence.mountPath`                           | Path to mount the volume at.                                                                                                               | `/var/lib/registry`         |
| `persistence.subPath`                             | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services                                    | `""`                        |
| `persistence.storageClass`                        | Storage class of backing PVC                                                                                                               | `""`                        |
| `persistence.annotations`                         | Persistent Volume Claim annotations                                                                                                        | `{}`                        |
| `persistence.labels`                              | Persistent Volume Claim labels                                                                                                             | `{}`                        |
| `persistence.accessModes`                         | Persistent Volume Access Modes                                                                                                             | `["ReadWriteOnce"]`         |
| `persistence.size`                                | Size of data volume                                                                                                                        | `8Gi`                       |
| `persistence.existingClaim`                       | The name of an existing PVC to use for persistence                                                                                         | `""`                        |
| `persistence.selector`                            | Selector to match an existing Persistent Volume for WordPress data PVC                                                                     | `{}`                        |
| `persistence.dataSource`                          | Custom PVC data source                                                                                                                     | `{}`                        |
| `ingress.enabled`                                 | Enable ingress                                                                                                                             | `false`                     |
| `ingress.pathType`                                | Ingress path type                                                                                                                          | `ImplementationSpecific`    |
| `ingress.apiVersion`                              | Force Ingress API version (automatically detected if not set)                                                                              | `""`                        |
| `ingress.hostname`                                | Default host for the ingress record                                                                                                        | `hostname.local`            |
| `ingress.ingressClassName`                        | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                              | `""`                        |
| `ingress.path`                                    | Default path for the ingress record                                                                                                        | `/`                         |
| `ingress.annotations`                             | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.           | `{}`                        |
| `ingress.tls`                                     | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                              | `false`                     |
| `ingress.selfSigned`                              | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                               | `false`                     |
| `ingress.extraHosts`                              | An array with additional hostname(s) to be covered with the ingress record                                                                 | `[]`                        |
| `ingress.extraPaths`                              | An array with additional arbitrary paths that may need to be added to the ingress under the main host                                      | `[]`                        |
| `ingress.extraTls`                                | TLS configuration for additional hostname(s) to be covered with this ingress record                                                        | `[]`                        |
| `ingress.secrets`                                 | Custom TLS certificates as secrets                                                                                                         | `[]`                        |
| `ingress.extraRules`                              | Additional rules to be covered with this ingress record                                                                                    | `[]`                        |
| `serviceAccount.create`                           | Specifies whether a ServiceAccount should be created                                                                                       | `true`                      |
| `serviceAccount.name`                             | The name of the ServiceAccount to use.                                                                                                     | `""`                        |
| `serviceAccount.annotations`                      | Additional Service Account annotations (evaluated as a template)                                                                           | `{}`                        |
| `serviceAccount.automountServiceAccountToken`     | Automount service account token for the server service account                                                                             | `true`                      |
| `service.type`                                    | service type                                                                                                                               | `ClusterIP`                 |
| `service.nodePorts`                               | Node ports to expose                                                                                                                       | `{}`                        |
| `service.clusterIP`                               | service Cluster IP                                                                                                                         | `""`                        |
| `service.loadBalancerIP`                          | service Load Balancer IP                                                                                                                   | `""`                        |
| `service.loadBalancerSourceRanges`                | service Load Balancer sources                                                                                                              | `[]`                        |
| `service.externalTrafficPolicy`                   | service external traffic policy                                                                                                            | `Cluster`                   |
| `service.annotations`                             | Additional custom annotations for service                                                                                                  | `{}`                        |
| `service.extraPorts`                              | Extra ports to expose in service (normally used with the `sidecars` value)                                                                 | `[]`                        |
| `service.sessionAffinity`                         | Control where client requests go, to the same pod or round-robin                                                                           | `None`                      |
| `service.sessionAffinityConfig`                   | Additional settings for the sessionAffinity                                                                                                | `{}`                        |
| `metrics.enabled`                                 | Enable the export of Prometheus metrics                                                                                                    | `false`                     |
| `metrics.serviceMonitor.enabled`                  | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`)                                     | `false`                     |
| `metrics.serviceMonitor.namespace`                | Namespace in which Prometheus is running                                                                                                   | `""`                        |
| `metrics.serviceMonitor.annotations`              | Additional custom annotations for the ServiceMonitor                                                                                       | `{}`                        |
| `metrics.serviceMonitor.labels`                   | Extra labels for the ServiceMonitor                                                                                                        | `{}`                        |
| `metrics.serviceMonitor.jobLabel`                 | The name of the label on the target service to use as the job name in Prometheus                                                           | `""`                        |
| `metrics.serviceMonitor.honorLabels`              | honorLabels chooses the metric's labels on collisions with target labels                                                                   | `false`                     |
| `metrics.serviceMonitor.interval`                 | Interval at which metrics should be scraped.                                                                                               | `""`                        |
| `metrics.serviceMonitor.scrapeTimeout`            | Timeout after which the scrape is ended                                                                                                    | `""`                        |
| `metrics.serviceMonitor.metricRelabelings`        | Specify additional relabeling of metrics                                                                                                   | `[]`                        |
| `metrics.serviceMonitor.relabelings`              | Specify general relabeling                                                                                                                 | `[]`                        |
| `metrics.serviceMonitor.selector`                 | Prometheus instance selector labels                                                                                                        | `{}`                        |
| `autoscaling.enabled`                             | Enable autoscaling for %%MAIN_OBJECT_BLOCK%%                                                                                               | `false`                     |
| `autoscaling.minReplicas`                         | Minimum number of replicas                                                                                                                 | `""`                        |
| `autoscaling.maxReplicas`                         | Maximum number of replicas                                                                                                                 | `""`                        |
| `autoscaling.targetCPU`                           | Target CPU utilization percentage                                                                                                          | `""`                        |
| `autoscaling.targetMemory`                        | Target Memory utilization percentage                                                                                                       | `""`                        |
| `podAffinityPreset`                               | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                        | `""`                        |
| `podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                   | `soft`                      |
| `nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                  | `""`                        |
| `nodeAffinityPreset.key`                          | Node label key to match. Ignored if `affinity` is set                                                                                      | `""`                        |
| `nodeAffinityPreset.values`                       | Node label values to match. Ignored if `affinity` is set                                                                                   | `[]`                        |
| `podSecurityContext.enabled`                      | Enabled pods' Security Context                                                                                                             | `true`                      |
| `podSecurityContext.fsGroup`                      | Set pod's Security Context fsGroup                                                                                                         | `1001`                      |
| `containerSecurityContext.enabled`                | Enabled containers' Security Context                                                                                                       | `true`                      |
| `containerSecurityContext.runAsUser`              | Set containers' Security Context runAsUser                                                                                                 | `1001`                      |
| `containerSecurityContext.runAsNonRoot`           | Set containers' Security Context runAsNonRoot                                                                                              | `true`                      |
| `containerSecurityContext.readOnlyRootFilesystem` | Set containers' Security Context runAsNonRoot                                                                                              | `false`                     |
| `diagnosticMode.enabled`                          | Enable diagnostic mode (all probes will be disabled and the command will be overridden)                                                    | `false`                     |
| `diagnosticMode.command`                          | Command to override all containers in the deployment                                                                                       | `["sleep"]`                 |
| `diagnosticMode.args`                             | Args to override all containers in the deployment                                                                                          | `["infinity"]`              |
