# postgresql

## usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

## Parameters

### Global parameters

| Name                                           | Description                                                                                                                                | Value                       |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------- |
| `global.imageRegistry`                         | Global Docker image registry                                                                                                               | `""`                        |
| `global.imagePullSecrets`                      | Global Docker registry secret names as an array                                                                                            | `[]`                        |
| `global.storageClass`                          | Global StorageClass for Persistent Volume(s)                                                                                               | `""`                        |
| `replicaCount`                                 | Number of PostgreSQL replicas                                                                                                              | `1`                         |
| `affinity.podAntiAffinityType`                 | Allowed values are: "preferred" or "required".                                                                                             | `required`                  |
| `image.registry`                               | image registry                                                                                                                             | `ghcr.io`                   |
| `image.repository`                             | image repository                                                                                                                           | `cloudnative-pg/postgresql` |
| `image.tag`                                    | image tag (immutable tags are recommended)                                                                                                 | `15.3-4`                    |
| `image.digest`                                 | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                        |
| `image.pullPolicy`                             | image pull policy                                                                                                                          | `IfNotPresent`              |
| `image.pullSecrets`                            | image pull secrets                                                                                                                         | `[]`                        |
| `backup.enabled`                               | Enable backup                                                                                                                              | `false`                     |
| `backup.endpointURL`                           | Endpoint to be used to upload data to the cloud                                                                                            | `""`                        |
| `backup.endpointCASecret`                      | Secret containing ca for the endpoint                                                                                                      | `""`                        |
| `backup.s3.enabled`                            | Use s3 for backup storage                                                                                                                  | `true`                      |
| `backup.s3.bucketName`                         | Name of the bucket                                                                                                                         | `""`                        |
| `backup.s3.existingSecret`                     | Name of the secret containing the credentials                                                                                              | `""`                        |
| `backup.s3.objectBucketClaim.enabled`          | Create the bucket from an ObjectBucketClaim                                                                                                | `false`                     |
| `backup.s3.objectBucketClaim.storageClassName` | StorageClass for the ObjectBucketClaim                                                                                                     | `""`                        |
| `backup.scheduled.enabled`                     | Enabled creation of a scheduled backup                                                                                                     | `false`                     |
| `backup.scheduled.schedule`                    | Schedule of the scheduled backup                                                                                                           | `0 0 0 * * *`               |
| `backup.retentionPolicy`                       | Retention for backups                                                                                                                      | `7d`                        |
| `persistence.storageClass`                     | PVC Storage Class for PostgreSQL Primary data volume                                                                                       | `""`                        |
| `persistence.size`                             | PVC Storage Request for PostgreSQL volume                                                                                                  | `8Gi`                       |
| `networkPolicy.enabled`                        | Enable network policies                                                                                                                    | `false`                     |
| `networkPolicy.apiserver.peer`                 | networkPolicyPeer of the apiserver                                                                                                         | `{}`                        |
| `networkPolicy.apiserver.port`                 | port of the apiserver                                                                                                                      | `6443`                      |
| `networkPolicy.backup.peer`                    | networkPolicyPeer of the object storage (see backup)                                                                                       | `{}`                        |
| `networkPolicy.cnpg.peer`                      | networkPolicyPeer of the operator, matches https://cloudnative-pg.io/documentation/1.20/installation_upgrade/ if not defined               | `{}`                        |
| `networkPolicy.metrics.peer`                   | networkPolicyPeer of the metrics scrape                                                                                                    | `{}`                        |
| `networkPolicy.egressRules`                    | additional egress rules                                                                                                                    | `[]`                        |
| `networkPolicy.ingressRules`                   | additional ingress rules                                                                                                                   | `[]`                        |
| `certificates.mode`                            | manage certificates by the operator or cert-manager                                                                                        | `operator-manager`          |
| `certificates.issuerRef`                       | cert-manager issuer for certificates. selfSigned issuer is created if empty                                                                | `{}`                        |

### Metrics Parameters

| Name                         | Description                                                               | Value   |
| ---------------------------- | ------------------------------------------------------------------------- | ------- |
| `metrics.enabled`            | Start a prometheus exporter                                               | `false` |
| `metrics.podMonitor.enabled` | Create PodMonitor Resource for scraping metrics using Prometheus Operator | `false` |
