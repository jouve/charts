---
title: jouve/charts
---

# usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

# charts

| chart                              | description                                                                                                 |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [jouve/extra][extra]               | Deploy a list of Kubernetes resources as a release with [bitnami/common][common] as a dependency.           |
| [jouve/hnc][hnc]                   | [Hierarchical Namespace Controller][upstream-hnc]. Policies and delegated creation to Kubernetes namespaces |
| [jouve/mailpit][mailpit]           | Deploy [mailpit][upstream-mailpit]: An email and SMTP testing tool with API for developers                  |
| [jouve/postgresql][postgresql]     | Deploy postgresql using [cloudnative-pg](https://cloudnative-pg.io/) operator                               |
| [jouve/subnamespace][subnamespace] | SubnamespaceAnchor is the Schema for the [subnamespace][upstream-hnc] API                                   |

[bitnami]:          https://github.com/bitnami/charts/tree/main/bitnami/common
[extra]:            https://github.com/jouve/charts/tree/main/charts/extra
[hnc]:              https://github.com/jouve/charts/tree/main/charts/hnc
[mailpit]:          https://github.com/jouve/charts/tree/main/charts/mailpit
[postgresql]:       https://github.com/jouve/charts/tree/main/charts/postgresql
[subnamespace]:     https://github.com/jouve/charts/tree/main/charts/subnamespace

[upstream-hnc]:     https://github.com/kubernetes-sigs/hierarchical-namespaces
[upstream-mailpit]: https://github.com/axllent/mailpit
