# mailpit

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Parameters

| Name                                              | Description                                                                                                                                | Value             |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------- |
| `image.registry`                                  | image registry                                                                                                                             | `docker.io`       |
| `image.repository`                                | image repository                                                                                                                           | `axllent/mailpit` |
| `image.tag`                                       | image tag (immutable tags are recommended)                                                                                                 | `v1.6.9`          |
| `image.digest`                                    | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`              |
| `image.pullPolicy`                                | image pull policy                                                                                                                          | `IfNotPresent`    |
| `image.pullSecrets`                               | image pull secrets                                                                                                                         | `[]`              |
| `image.debug`                                     | Enable image debug mode                                                                                                                    | `false`           |
| `updateStrategy.type`                             | statefulset strategy type                                                                                                                  | `RollingUpdate`   |
| `replicaCount`                                    | Number of replicas to deploy                                                                                                               | `1`               |
| `containerPorts.http`                             | HTTP container port                                                                                                                        | `8025`            |
| `containerPorts.smtp`                             | HTTPS container port                                                                                                                       | `1025`            |
| `resources.limits`                                | The resources limits for the containers                                                                                                    | `{}`              |
| `resources.requests`                              | The requested resources for the containers                                                                                                 | `{}`              |
| `podSecurityContext.enabled`                      | Enabled pods' Security Context                                                                                                             | `true`            |
| `podSecurityContext.fsGroup`                      | Set pod's Security Context fsGroup                                                                                                         | `1001`            |
| `containerSecurityContext.enabled`                | Enabled containers' Security Context                                                                                                       | `true`            |
| `containerSecurityContext.runAsUser`              | Set containers' Security Context runAsUser                                                                                                 | `1001`            |
| `containerSecurityContext.runAsGroup`             | Set containers' Security Context runAsGroup                                                                                                | `1001`            |
| `containerSecurityContext.runAsNonRoot`           | Set containers' Security Context runAsNonRoot                                                                                              | `true`            |
| `containerSecurityContext.readOnlyRootFilesystem` | Set containers' Security Context runAsNonRoot                                                                                              | `true`            |
| `args`                                            | Override default container args (useful when using custom images)                                                                          | `[]`              |
| `extraEnvVars`                                    | Array with extra environment variables to add to nodes                                                                                     | `[]`              |
| `mailpit.ui.authFile.enabled`                     | Adding basic authentication to web UI                                                                                                      | `false`           |
| `mailpit.ui.authFile.htpasswd`                    | htpasswd content                                                                                                                           | `""`              |
| `mailpit.ui.tls.enabled`                          | Enable tls for web UI                                                                                                                      | `false`           |
| `mailpit.ui.tls.secretName`                       | tls secret for web UI                                                                                                                      | `""`              |
| `mailpit.smtp.authFile.enabled`                   | Adding SMTP authentication                                                                                                                 | `false`           |
| `mailpit.smtp.authFile.htpasswd`                  | htpasswd content                                                                                                                           | `""`              |
| `mailpit.smtp.tls.enabled`                        | Enable tls for SMTP                                                                                                                        | `false`           |
| `mailpit.smtp.tls.secretName`                     | tls secret for SMTP                                                                                                                        | `""`              |

### Traffic Exposure Parameters

| Name                       | Description                                                                                                                      | Value            |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| `service.http.type`        | service type                                                                                                                     | `ClusterIP`      |
| `service.smtp.type`        | service type                                                                                                                     | `ClusterIP`      |
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
