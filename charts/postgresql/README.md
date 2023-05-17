# postgresql

## usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

## Parameters

### Global parameters

| Name                                        | Description                                                                 | Value              |
| ------------------------------------------- | --------------------------------------------------------------------------- | ------------------ |
| `global.imageRegistry`                      | Global Docker image registry                                                | `""`               |
| `global.imagePullSecrets`                   | Global Docker registry secret names as an array                             | `[]`               |
| `global.storageClass`                       | Global StorageClass for Persistent Volume(s)                                | `""`               |
| `replicaCount`                              | Number of PostgreSQL replicas                                               | `1`                |
| `backup.enabled`                            | Enable backup                                                               | `false`            |
| `backup.endpointURL`                        | Endpoint to be used to upload data to the cloud                             | `""`               |
| `backup.bucketName`                         | Name of the bucket                                                          | `""`               |
| `backup.existingSecret`                     | Name of the secret containing the credentials                               | `""`               |
| `backup.objectBucketClaim.enabled`          | Create the bucket from an ObjectBucketClaim                                 | `false`            |
| `backup.objectBucketClaim.storageClassName` | StorageClass for the ObjectBucketClaim                                      | `""`               |
| `persistence.storageClass`                  | PVC Storage Class for PostgreSQL Primary data volume                        | `""`               |
| `persistence.size`                          | PVC Storage Request for PostgreSQL volume                                   | `8Gi`              |
| `networkPolicy.enabled`                     | Enable network policies                                                     | `false`            |
| `networkPolicy.apiServerPeer`               | networkPolicyPeer of the apiserver                                          | `{}`               |
| `networkPolicy.cnpgPeer`                    | networkPolicyPeer of the operator                                           | `{}`               |
| `networkPolicy.objectStoragePeer`           | networkPolicyPeer of the object storage (see backup)                        | `{}`               |
| `networkPolicy.egressRules`                 | additional egress rules                                                     | `[]`               |
| `networkPolicy.ingressRules`                | additional ingress rules                                                    | `[]`               |
| `certificates.mode`                         | manage certificates by the operator or cert-manager                         | `operator-manager` |
| `certificates.issuerRef`                    | cert-manager issuer for certificates. selfSigned issuer is created if empty | `{}`               |

### Metrics Parameters

| Name                         | Description                                                               | Value   |
| ---------------------------- | ------------------------------------------------------------------------- | ------- |
| `metrics.enabled`            | Start a prometheus exporter                                               | `false` |
| `metrics.podMonitor.enabled` | Create PodMonitor Resource for scraping metrics using Prometheus Operator | `false` |
