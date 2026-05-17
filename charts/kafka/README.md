# kafka

Deploy an Apache Kafka cluster in KRaft mode using the Strimzi Kafka operator.

## Usage

Preferred (OCI):

```console
helm install kafka oci://ghcr.io/jouve/charts/kafka
```

Charts pushed to `oci://` are signed keyless via [cosign](https://docs.sigstore.dev/cosign/) and GitHub Actions OIDC. Verify with:

```console
cosign verify ghcr.io/jouve/charts/kafka:<version> \
  --certificate-identity-regexp 'https://github.com/jouve/charts/\.github/workflows/release\.yaml@.*' \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com
```

Or legacy repo:

```console
helm repo add jouve https://jouve.github.io/charts/
helm install kafka jouve/kafka
```

## Parameters

### Global parameters

| Name                      | Description                                        | Value |
| ------------------------- | -------------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                       | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array    | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)       | `""`  |
| `replicaCount`            | Number of Kafka combined (controller+broker) nodes | `3`   |

### Kafka Cluster

| Name                    | Description                                                    | Value     |
| ----------------------- | -------------------------------------------------------------- | --------- |
| `kafka.version`         | Apache Kafka version                                           | `4.2.0`   |
| `kafka.metadataVersion` | KRaft metadata version (must be compatible with kafka.version) | `4.2-IV1` |
| `kafka.config`          | Extra broker configuration (merged into spec.kafka.config)     | `{}`      |
| `kafka.listeners`       | Listener configuration (defaults: plain 9092, tls 9093)        | `[]`      |

### Node pool (combined controller+broker, one pool by default)

| Name                                | Description                                                                                                                                                                      | Value                     |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `nodePool.name`                     | Name of the KafkaNodePool                                                                                                                                                        | `combined`                |
| `nodePool.roles`                    | Roles assigned to the pool. Valid values: controller, broker                                                                                                                     | `["controller","broker"]` |
| `nodePool.resourcesPreset`          | Set container resources according to one common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge). This is ignored if nodePool.resources is set. | `none`                    |
| `nodePool.resources`                | Resource requests/limits for the kafka container                                                                                                                                 | `{}`                      |
| `nodePool.persistence.storageClass` | StorageClass for Kafka data volume                                                                                                                                               | `""`                      |
| `nodePool.persistence.size`         | PVC Storage Request for Kafka data volume                                                                                                                                        | `20Gi`                    |
| `nodePool.persistence.deleteClaim`  | Whether to delete the PVC when the node pool is removed                                                                                                                          | `false`                   |

### EntityOperator (TopicOperator + UserOperator)

| Name                                                    | Description                                                                                             | Value   |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------- |
| `entityOperator.topicOperator.enabled`                  | Enable the TopicOperator                                                                                | `true`  |
| `entityOperator.topicOperator.containerSecurityContext` | Container security context                                                                              | `{}`    |
| `entityOperator.userOperator.enabled`                   | Enable the UserOperator                                                                                 | `true`  |
| `entityOperator.userOperator.containerSecurityContext`  | Container security context                                                                              | `{}`    |
| `entityOperator.podSecurityContext`                     | Pod security context                                                                                    | `{}`    |
| `podSecurityContext`                                    | Pod security context                                                                                    | `{}`    |
| `containerSecurityContext`                              | Container security context                                                                              | `{}`    |
| `networkPolicy.enabled`                                 | Enable network policies                                                                                 | `false` |
| `networkPolicy.strimzi.peer`                            | networkPolicyPeer of the Strimzi cluster operator, matches strimzi-cluster-operator pods if not defined | `{}`    |
| `networkPolicy.metrics.peer`                            | networkPolicyPeer of the metrics scrape                                                                 | `{}`    |
| `networkPolicy.clients.peer`                            | networkPolicyPeer of the Kafka clients (defaults to same-namespace)                                     | `{}`    |
| `networkPolicy.egressRules`                             | additional egress rules                                                                                 | `[]`    |
| `networkPolicy.ingressRules`                            | additional ingress rules                                                                                | `[]`    |

### Metrics Parameters

| Name                         | Description                                                                    | Value   |
| ---------------------------- | ------------------------------------------------------------------------------ | ------- |
| `metrics.enabled`            | Expose JMX metrics via the Strimzi-bundled exporter                            | `false` |
| `metrics.podMonitor.enabled` | Create PodMonitor Resource for scraping metrics using Prometheus Operator      | `false` |
| `commonLabels`               | Labels to add to all deployed resources                                        | `{}`    |
| `commonAnnotations`          | Annotations to add to all deployed resources                                   | `{}`    |
| `extraDeploy`                | Array of extra objects to deploy with the release (e.g. KafkaTopic, KafkaUser) | `[]`    |
