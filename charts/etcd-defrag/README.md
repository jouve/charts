# etcd-defrag

Deploys [ahrtr/etcd-defrag](https://github.com/ahrtr/etcd-defrag) as a Kubernetes CronJob.

The default configuration targets a kubeadm-style, stacked etcd cluster. It schedules the
Pod on a control-plane node, reaches the local member over the host network, discovers all
members, and defragments the leader last. Set `tls.type` to `kubeadm` (default), `kubespray`,
`rke2`, or `custom` to select the host-side etcd PKI layout. Container mount paths are fixed.

The container runs as UID 0 by default because kubeadm commonly creates
`apiserver-etcd-client.key` as `0600 root:root`. The container otherwise drops all
capabilities, disables privilege escalation, and uses a read-only root filesystem.

## Usage

Prefer OCI:

```console
helm install etcd-defrag oci://ghcr.io/jouve/charts/etcd-defrag --namespace kube-system
```

Charts pushed to `oci://` are signed keyless with cosign and GitHub Actions OIDC:

```console
cosign verify ghcr.io/jouve/charts/etcd-defrag:<version> \
  --certificate-identity-regexp 'https://github.com/jouve/charts/\.github/workflows/release\.yaml@.*' \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com
```

Or use the legacy repository:

```console
helm repo add jouve https://jouve.github.io/charts/
helm install etcd-defrag jouve/etcd-defrag --namespace kube-system
```

For another PKI layout, select `custom` and provide all three host paths:

```yaml
tls:
  type: custom
  custom:
    caCert: /custom/etcd/ca.crt
    clientCert: /custom/etcd/client.crt
    clientKey: /custom/etcd/client.key
```

## Parameters

### Global parameters

| Name                      | Description                                        | Value |
| ------------------------- | -------------------------------------------------- | ----- |
| `global.imageRegistry`    | Global container image registry                    | `""`  |
| `global.imagePullSecrets` | Global container registry secret names as an array | `[]`  |

### Common parameters

| Name                | Description                                     | Value |
| ------------------- | ----------------------------------------------- | ----- |
| `nameOverride`      | String to partially override common.names.name  | `""`  |
| `fullnameOverride`  | String to fully override common.names.fullname  | `""`  |
| `namespaceOverride` | String to fully override common.names.namespace | `""`  |
| `commonLabels`      | Labels to add to all deployed objects           | `{}`  |
| `commonAnnotations` | Annotations to add to all deployed objects      | `{}`  |

### Image parameters

| Name                | Description                                                | Value               |
| ------------------- | ---------------------------------------------------------- | ------------------- |
| `image.registry`    | etcd-defrag image registry                                 | `ghcr.io`           |
| `image.repository`  | etcd-defrag image repository                               | `ahrtr/etcd-defrag` |
| `image.tag`         | etcd-defrag image tag                                      | `v0.45.0`           |
| `image.digest`      | etcd-defrag image digest; overrides the image tag when set | `""`                |
| `image.pullPolicy`  | etcd-defrag image pull policy                              | `IfNotPresent`      |
| `image.pullSecrets` | etcd-defrag image pull secrets                             | `[]`                |

### CronJob parameters

| Name                         | Description                                         | Value        |
| ---------------------------- | --------------------------------------------------- | ------------ |
| `schedule`                   | Cron schedule                                       | `17 3 * * *` |
| `timeZone`                   | Time zone for the CronJob schedule                  | `Etc/UTC`    |
| `suspend`                    | Suspend subsequent executions                       | `false`      |
| `concurrencyPolicy`          | Concurrent execution policy                         | `Forbid`     |
| `startingDeadlineSeconds`    | Deadline in seconds for starting a missed execution | `300`        |
| `successfulJobsHistoryLimit` | Number of successful Jobs to retain                 | `3`          |
| `failedJobsHistoryLimit`     | Number of failed Jobs to retain                     | `3`          |
| `activeDeadlineSeconds`      | Maximum duration of one Job in seconds              | `600`        |
| `backoffLimit`               | Number of retries before a Job is considered failed | `0`          |
| `restartPolicy`              | Pod restart policy                                  | `Never`      |

### etcd-defrag parameters

| Name                           | Description                                                         | Value                        |
| ------------------------------ | ------------------------------------------------------------------- | ---------------------------- |
| `config.endpoints`             | etcd endpoint URLs                                                  | `["https://127.0.0.1:2379"]` |
| `config.cluster`               | Discover and defragment every member of the cluster                 | `true`                       |
| `config.compaction`            | Compact etcd before defragmenting it                                | `true`                       |
| `config.continueOnError`       | Continue with other endpoints after one endpoint fails              | `false`                      |
| `config.moveLeader`            | Move leadership before defragmenting the leader                     | `true`                       |
| `config.waitBetweenDefrags`    | Delay between consecutive defragmentation operations                | `60s`                        |
| `config.commandTimeout`        | Command timeout, excluding the dial timeout                         | `30s`                        |
| `config.dialTimeout`           | Client connection timeout                                           | `2s`                         |
| `config.etcdStorageQuotaBytes` | etcd backend quota in bytes                                         | `2147483648`                 |
| `config.defragRule`            | Boolean expression that selects members to defragment               | `dbSizeFree / dbSize >= 0.2` |
| `config.autoDisalarm`          | Automatically clear NOSPACE alarms after successful defragmentation | `false`                      |
| `config.disalarmThreshold`     | DB-to-quota ratio below which NOSPACE alarms can be cleared         | `0.9`                        |
| `extraArgs`                    | Extra arguments passed to etcd-defrag                               | `[]`                         |

### TLS parameters

| Name                    | Description                                                          | Value     |
| ----------------------- | -------------------------------------------------------------------- | --------- |
| `tls.type`              | TLS layout (`kubeadm`, `kubespray`, `rke2` or `custom`)              | `kubeadm` |
| `tls.custom.caCert`     | Host path of the etcd CA certificate when `tls.type` is `custom`     | `""`      |
| `tls.custom.clientCert` | Host path of the etcd client certificate when `tls.type` is `custom` | `""`      |
| `tls.custom.clientKey`  | Host path of the etcd client key when `tls.type` is `custom`         | `""`      |

### Pod parameters

| Name                       | Description                                                                                                                                                    | Value                                   |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| `hostNetwork`              | Use the host network to reach a local etcd endpoint                                                                                                            | `true`                                  |
| `dnsPolicy`                | Pod DNS policy                                                                                                                                                 | `ClusterFirstWithHostNet`               |
| `podAnnotations`           | Extra annotations for Pods                                                                                                                                     | `{}`                                    |
| `podLabels`                | Extra labels for Pods                                                                                                                                          | `{}`                                    |
| `podSecurityContext`       | Pod security context                                                                                                                                           | `{}`                                    |
| `containerSecurityContext` | etcd-defrag container security context                                                                                                                         | `{}`                                    |
| `resourcesPreset`          | Set container resources according to a common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge); ignored when resources is set | `nano`                                  |
| `resources`                | Set container resource requests and limits                                                                                                                     | `{}`                                    |
| `priorityClassName`        | Priority class assigned to the Pod                                                                                                                             | `""`                                    |
| `nodeSelector`             | Node labels for Pod assignment                                                                                                                                 | `{}`                                    |
| `affinity`                 | Affinity rules for Pod assignment                                                                                                                              | `{}`                                    |
| `tolerations[0].effect`    | Taint effect tolerated on control-plane nodes                                                                                                                  | `NoSchedule`                            |
| `tolerations[0].key`       | Control-plane taint key                                                                                                                                        | `node-role.kubernetes.io/control-plane` |
| `tolerations[0].operator`  | Toleration operator for the control-plane taint                                                                                                                | `Exists`                                |
| `extraEnvVars`             | Extra environment variables for the container                                                                                                                  | `[]`                                    |
| `initContainers`           | Add additional init containers to the Pod                                                                                                                      | `[]`                                    |
| `extraVolumes`             | Extra volumes for the Pod                                                                                                                                      | `[]`                                    |
| `extraVolumeMounts`        | Extra volume mounts for the container                                                                                                                          | `[]`                                    |

### ServiceAccount parameters

| Name                                          | Description                                                       | Value   |
| --------------------------------------------- | ----------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Create a ServiceAccount                                           | `true`  |
| `serviceAccount.name`                         | ServiceAccount name; generated when empty and creation is enabled | `""`    |
| `serviceAccount.annotations`                  | Additional ServiceAccount annotations                             | `{}`    |
| `serviceAccount.automountServiceAccountToken` | Automount the ServiceAccount token                                | `false` |

### Extra deployment parameters

| Name          | Description                                         | Value |
| ------------- | --------------------------------------------------- | ----- |
| `extraDeploy` | Extra Kubernetes objects to deploy with the release | `[]`  |
