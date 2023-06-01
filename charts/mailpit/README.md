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

| Name                             | Description                                                                                                                                | Value             |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------- |
| `image.registry`                 | image registry                                                                                                                             | `docker.io`       |
| `image.repository`               | image repository                                                                                                                           | `axllent/mailpit` |
| `image.tag`                      | image tag (immutable tags are recommended)                                                                                                 | `v1.6.13`         |
| `image.digest`                   | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`              |
| `image.pullPolicy`               | image pull policy                                                                                                                          | `IfNotPresent`    |
| `image.pullSecrets`              | image pull secrets                                                                                                                         | `[]`              |
| `image.debug`                    | Enable image debug mode                                                                                                                    | `false`           |
| `updateStrategy.type`            | statefulset strategy type                                                                                                                  | `RollingUpdate`   |
| `replicaCount`                   | Number of replicas to deploy                                                                                                               | `1`               |
| `resources.limits.cpu`           | The resources limits for the containers                                                                                                    | `100m`            |
| `resources.limits.memory`        | The resources limits for the containers                                                                                                    | `64Mi`            |
| `resources.requests.cpu`         | The requested resources for the containers                                                                                                 | `10m`             |
| `resources.requests.memory`      | The requested resources for the containers                                                                                                 | `8Mi`             |
| `args`                           | Override default container args (useful when using custom images)                                                                          | `[]`              |
| `extraEnvVars`                   | Array with extra environment variables to add to nodes                                                                                     | `[]`              |
| `mailpit.ui.authFile.enabled`    | Adding basic authentication to web UI                                                                                                      | `false`           |
| `mailpit.ui.authFile.htpasswd`   | htpasswd content                                                                                                                           | `""`              |
| `mailpit.ui.tls.enabled`         | Enable tls for web UI                                                                                                                      | `false`           |
| `mailpit.ui.tls.secretName`      | tls secret for web UI                                                                                                                      | `""`              |
| `mailpit.smtp.authFile.enabled`  | Adding SMTP authentication                                                                                                                 | `false`           |
| `mailpit.smtp.authFile.htpasswd` | htpasswd content                                                                                                                           | `""`              |
| `mailpit.smtp.tls.enabled`       | Enable tls for SMTP                                                                                                                        | `false`           |
| `mailpit.smtp.tls.secretName`    | tls secret for SMTP                                                                                                                        | `""`              |
| `mailpit.relay.enabled`          | enable SMTP Relay configuration                                                                                                            | `false`           |
| `mailpit.relay.config`           | Mailpit SMTP relay configuration                                                                                                           | `{}`              |
| `mailpit.relay.relayAll`         | Relay all messages to relay                                                                                                                | `false`           |

### Traffic Exposure Parameters

| Name                       | Description                                                                                                                      | Value            |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| `service.http.type`        | service type                                                                                                                     | `ClusterIP`      |
| `service.http.nodePort`    | nodeport bind for HTTP service                                                                                                   | `nil`            |
| `service.smtp.type`        | service type                                                                                                                     | `ClusterIP`      |
| `service.smtp.nodePort`    | nodeport bind for STMP service                                                                                                   | `nil`            |
| `ingress.enabled`          | Enable ingress record generation for %%MAIN_CONTAINER_NAME%%                                                                     | `false`          |
| `ingress.hostname`         | Default host for the ingress record                                                                                              | `hostname.local` |
| `ingress.ingressClassName` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`             |
| `ingress.path`             | Default path for the ingress record                                                                                              | `/`              |
| `ingress.annotations`      | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`             |
| `ingress.tls`              | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`          |

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
