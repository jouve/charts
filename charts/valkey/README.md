# valkey

## usage

Prefered using oci:

```console
helm install valkey oci://ghcr.io/jouve/charts/valkey
```

Charts pushed to `oci://` are signed keyless via [cosign](https://docs.sigstore.dev/cosign/) and GitHub Actions OIDC. Verify with:

```console
cosign verify ghcr.io/jouve/charts/valkey:<version> \
  --certificate-identity-regexp 'https://github.com/jouve/charts/\.github/workflows/release\.yaml@.*' \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com
```

Or legacy repo:

```console
helm repo add jouve https://jouve.github.io/charts/
helm install valkey jouve/valkey
```

## Parameters

### Global parameters

| Name                        | Description                                                                                                                                                     | Value           |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| `global.imageRegistry`      | Global Docker image registry                                                                                                                                    | `""`            |
| `global.imagePullSecrets`   | Global Docker registry secret names as an array                                                                                                                 | `[]`            |
| `global.storageClass`       | Global StorageClass for Persistent Volume(s)                                                                                                                    | `""`            |
| `shards`                    | Number of shard groups (primaries)                                                                                                                              | `1`             |
| `replicas`                  | Number of replica ValkeyNodes per shard                                                                                                                         | `0`             |
| `resourcesPreset`           | Set container resources according to one common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge). Ignored if resources is set. | `none`          |
| `image.registry`            | Valkey image registry                                                                                                                                           | `docker.io`     |
| `image.repository`          | Valkey image repository                                                                                                                                         | `valkey/valkey` |
| `image.tag`                 | Valkey image tag. Empty -> operator default.                                                                                                                    | `9.0.2`         |
| `image.digest`              | Valkey image digest. Overrides image.tag if set.                                                                                                                | `""`            |
| `image.pullPolicy`          | Image pull policy                                                                                                                                               | `IfNotPresent`  |
| `image.pullSecrets`         | Image pull secrets                                                                                                                                              | `[]`            |
| `resources`                 | Resource requests/limits for the valkey container. Empty -> operator default.                                                                                   | `{}`            |
| `persistence.enabled`       | Enable durable storage (PVC) per ValkeyNode                                                                                                                     | `false`         |
| `persistence.size`          | Requested PVC size                                                                                                                                              | `1Gi`           |
| `persistence.storageClass`  | StorageClass for the PVC. Empty -> cluster default.                                                                                                             | `""`            |
| `persistence.reclaimPolicy` | Reclaim policy for the managed PVC. Retain | Delete.                                                                                                            | `Retain`        |

### Exporter (metrics sidecar)

| Name                         | Description                                                                                                                                | Value                      |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `exporter.enabled`           | Enable the exporter sidecar container in each ValkeyNode                                                                                   | `true`                     |
| `exporter.image.registry`    | image registry                                                                                                                             | `docker.io`                |
| `exporter.image.repository`  | image repository                                                                                                                           | `oliver006/redis_exporter` |
| `exporter.image.tag`         | image tag (immutable tags are recommended)                                                                                                 | `v1.80.0`                  |
| `exporter.image.digest`      | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                       |
| `exporter.image.pullPolicy`  | image pull policy                                                                                                                          | `IfNotPresent`             |
| `exporter.image.pullSecrets` | image pull secrets                                                                                                                         | `[]`                       |
| `exporter.resources`         | Resource requests/limits for the exporter container                                                                                        | `{}`                       |
| `users`                      | Users                                                                                                                                      | `[]`                       |
| `config`                     | [objectE  Valkey config                                                                                                                    | `{}`                       |
| `nodeSelector`               | NodeSelector to apply to the ValkeyNode pods                                                                                               | `{}`                       |
| `tolerations`                | Tolerations to apply to the ValkeyNode pods                                                                                                | `[]`                       |
| `affinity`                   | Affinity rules. Overrides the operator's default soft anti-affinity if set.                                                                | `{}`                       |

### Metrics Parameters

| Name                                   | Description                                                                   | Value   |
| -------------------------------------- | ----------------------------------------------------------------------------- | ------- |
| `metrics.podMonitor.enabled`           | Create a PodMonitor scraping the exporter sidecar (requires exporter.enabled) | `false` |
| `metrics.podMonitor.interval`          | Scrape interval                                                               | `30s`   |
| `metrics.podMonitor.scrapeTimeout`     | Scrape timeout                                                                | `10s`   |
| `metrics.podMonitor.labels`            | Extra labels for the PodMonitor                                               | `{}`    |
| `metrics.podMonitor.relabelings`       | RelabelConfigs to apply to samples before scraping                            | `[]`    |
| `metrics.podMonitor.metricRelabelings` | MetricRelabelConfigs to apply before ingestion                                | `[]`    |
| `extraDeploy`                          | Array of extra objects to deploy with the release                             | `[]`    |
| `commonLabels`                         | Add labels to all the deployed resources                                      | `{}`    |
| `commonAnnotations`                    | Add annotations to all the deployed resources                                 | `{}`    |
