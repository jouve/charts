# extra

Deploy a list of Kubernetes resources as a release.

It is inspired by the `extraDeploy` of [bitnami charts](https://github.com/bitnami/charts/)
and includes [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common) as a dependency.

## usage

Prefered using oci:
```console
helm install mailpit oci://ghcr.io/jouve/charts/extra
```

Charts pushed to `oci://` are signed keyless via [cosign](https://docs.sigstore.dev/cosign/) and GitHub Actions OIDC. Verify with:
```console
cosign verify ghcr.io/jouve/charts/extra:<version> \
  --certificate-identity-regexp 'https://github.com/jouve/charts/\.github/workflows/release\.yaml@.*' \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com
```

Or legacy repo:
```console
helm repo add jouve https://jouve.github.io/charts/
helm install mailpit jouve/extra
```

## Parameters

### Common parameters

| Name          | Description                                       | Value |
| ------------- | ------------------------------------------------- | ----- |
| `extraDeploy` | Array of extra objects to deploy with the release | `[]`  |
