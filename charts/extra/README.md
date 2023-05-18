# extra

Deploy a list of Kubernetes resources as a release.

It is inspired by the `extraDeploy` of [bitnami charts](https://github.com/bitnami/charts/)
and includes [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common) as a dependency.

## usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

## Parameters

### Common parameters

| Name          | Description                                       | Value |
| ------------- | ------------------------------------------------- | ----- |
| `extraDeploy` | Array of extra objects to deploy with the release | `[]`  |
