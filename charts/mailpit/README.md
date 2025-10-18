# mailpit

## usage

```console
helm repo add jouve https://jouve.github.io/charts/
helm install mailpit jouve/mailpit
```

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common

| Name                                   | Description                                                                                                                                                                                                | Value             |
| -------------------------------------- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|
| `image.registry`                       | image registry                                                                                                                                                                                             | `docker.io`       |
| `image.repository`                     | image repository                                                                                                                                                                                           | `axllent/mailpit` |
| `image.tag`                            | image tag (immutable tags are recommended)                                                                                                                                                                 | `v1.27.1`         |
| `image.digest`                         | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended)                                                                 | `""`              |
| `image.pullPolicy`                     | image pull policy                                                                                                                                                                                          | `IfNotPresent`    |
| `image.pullSecrets`                    | image pull secrets                                                                                                                                                                                         | `[]`              |
| `image.debug`                          | Enable image debug mode                                                                                                                                                                                    | `false`           |
| `commonLabels`                         | Labels to add to all deployed objects                                                                                                                                                                      | `{}`              |
| `podLabels`                            | Extra labels for pods                                                                                                                                                                                      | `{}`              |
| `updateStrategy.type`                  | statefulset strategy type                                                                                                                                                                                  | `RollingUpdate`   |
| `podSecurityContext`                   | SecurityContext for pods                                                                                                                                                                                   | `{}`              |
| `containerSecurityContext`             | SecurityContext for pods                                                                                                                                                                                   | `{}`              |
| `replicaCount`                         | Number of replicas to deploy                                                                                                                                                                               | `1`               |
| `revisionHistoryLimit`                 | The number of old history to retain to allow rollback                                                                                                                                                      | `10`              |
| `resourcesPreset`                      | Set container resources according to one common preset (allowed values: none, nano, small, medium, large, xlarge, 2xlarge). This is ignored if resources is set (resources is recommended for production). | `nano`            |
| `priorityClassName`                    | Name of the priorityClass to apply to the Cluster Agent                                                                                                                                                    | `""`              |
| `resources`                            | The resources for the containers                                                                                                                                                                           | `{}`              |
| `affinity`                             | Pod affinity                                                                                                                                                                                               | `{}`              |
| `args`                                 | Override default container args (useful when using custom images)                                                                                                                                          | `[]`              |
| `extraEnvVars`                         | Array with extra environment variables to add to nodes                                                                                                                                                     | `[]`              |
| `extraEnvVarsSecret`                   | Name of existing Secret containing extra env vars for containers                                                                                                                                           | `""`              |
| `livenessProbe`                        | Enables the livenessProbe for mailpit                                                                                                                                                                      | `{}`              |
| `readinessProbe`                       | Enables the readinessProbe for mailpit                                                                                                                                                                     | `{}`              |
| `nodeSelector`                         | Node labels for pod assignment                                                                                                                                                                             | `{}`              |
| `tolerations`                          | expects input structure as per specification https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#toleration-v1-core                                                                       | `[]`              |
| `enableServiceLinks`                   | enabled by default https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.26                                                                                                                     | `true`            |
| `mailpit.webroot`                      | Set the webroot for web UI & API                                                                                                                                                                           | `/`               |
| `mailpit.ui.authFile.enabled`          | Adding basic authentication to web UI                                                                                                                                                                      | `false`           |
| `mailpit.ui.authFile.htpasswd`         | htpasswd content                                                                                                                                                                                           | `""`              |
| `mailpit.ui.authFile.existingSecret`   | Secret containing htpasswd content                                                                                                                                                                         | `{}`              |
| `mailpit.ui.tls.enabled`               | Enable tls for web UI                                                                                                                                                                                      | `false`           |
| `mailpit.ui.tls.secretName`            | tls secret for web UI                                                                                                                                                                                      | `""`              |
| `mailpit.smtp.authFile.enabled`        | Adding SMTP authentication                                                                                                                                                                                 | `false`           |
| `mailpit.smtp.authFile.htpasswd`       | htpasswd content                                                                                                                                                                                           | `""`              |
| `mailpit.smtp.authFile.existingSecret` | Secret containing htpasswd content                                                                                                                                                                         | `{}`              |
| `mailpit.smtp.tls.enabled`             | Enable tls for SMTP                                                                                                                                                                                        | `false`           |
| `mailpit.smtp.tls.secretName`          | tls secret for SMTP                                                                                                                                                                                        | `""`              |
| `mailpit.relay.enabled`                | enable SMTP Relay configuration                                                                                                                                                                            | `false`           |
| `mailpit.relay.config`                 | Mailpit SMTP relay configuration                                                                                                                                                                           | `{}`              |
| `mailpit.relay.relayAll`               | Relay all messages to relay                                                                                                                                                                                | `false`           |

### Traffic Exposure Parameters

| Name                                    | Description                                                                                                                      | Value                    |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.http.name`                     | service name, default to ${common.names.fullname}-http, e.g. mailpit-http                                                        | `""`                     |
| `service.http.type`                     | service type                                                                                                                     | `ClusterIP`              |
| `service.http.port`                     | port for http                                                                                                                    | `80`                     |
| `service.http.nodePort`                 | nodeport bind for HTTP service                                                                                                   | `0`                      |
| `service.http.loadBalancerIP`           | %%MAIN_CONTAINER_NAME%% service Load Balancer IP                                                                                 | `""`                     |
| `service.http.loadBalancerSourceRanges` | %%MAIN_CONTAINER_NAME%% service Load Balancer sources                                                                            | `[]`                     |
| `service.http.externalTrafficPolicy`    | %%MAIN_CONTAINER_NAME%% service external traffic policy                                                                          | `Cluster`                |
| `service.smtp.name`                     | service name, default to ${common.names.fullname}-smtp, e.g. mailpit-smtp                                                        | `""`                     |
| `service.smtp.type`                     | service type                                                                                                                     | `ClusterIP`              |
| `service.smtp.port`                     | port for SMTP                                                                                                                    | `25`                     |
| `service.smtp.nodePort`                 | nodeport bind for STMP service                                                                                                   | `0`                      |
| `service.smtp.loadBalancerIP`           | %%MAIN_CONTAINER_NAME%% service Load Balancer IP                                                                                 | `""`                     |
| `service.smtp.loadBalancerSourceRanges` | %%MAIN_CONTAINER_NAME%% service Load Balancer sources                                                                            | `[]`                     |
| `service.smtp.externalTrafficPolicy`    | %%MAIN_CONTAINER_NAME%% service external traffic policy                                                                          | `Cluster`                |
| `ingress.enabled`                       | Enable ingress record generation for %%MAIN_CONTAINER_NAME%%                                                                     | `false`                  |
| `ingress.annotations`                   | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.ingressClassName`              | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.hostname`                      | Default host for the ingress record                                                                                              | `hostname.local`         |
| `ingress.path`                          | Default path for the ingress record                                                                                              | `/`                      |
| `ingress.pathType`                      | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.extraHosts`                    | The list of additional hostnames to be covered with this ingress record.                                                         | `[]`                     |
| `ingress.tls`                           | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `ingress.extraTls`                      | The tls configuration for additional hostnames to be covered with this ingress record.                                           | `[]`                     |

### Persistence Parameters

| Name                        | Description                                                            | Value               |
| --------------------------- | ---------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`       | Enable persistence using Persistent Volume Claims                      | `false`             |
| `persistence.storageClass`  | Storage class of backing PVC                                           | `""`                |
| `persistence.annotations`   | Persistent Volume Claim annotations                                    | `{}`                |
| `persistence.labels`        | Persistent Volume Claim labels                                         | `{}`                |
| `persistence.accessModes`   | Persistent Volume Access Modes                                         | `["ReadWriteOnce"]` |
| `persistence.size`          | Size of data volume                                                    | `8Gi`               |
| `persistence.existingClaim` | The name of an existing PVC to use for persistence                     | `""`                |
| `persistence.selector`      | Selector to match an existing Persistent Volume for WordPress data PVC | `{}`                |
| `persistence.dataSource`    | Custom PVC data source                                                 | `{}`                |

## tips

### Existing Secrets

Existing Secrets are using [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#existingsecret) scheme.

```yaml
mailpit:
  ui:
    authFile:
      enabled: true
      existingSecret:
        name: my-secret
```
