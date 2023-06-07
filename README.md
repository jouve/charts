# usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

# charts

| chart                                     | description                                                                                                                                          |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| [jouve/extra](charts/extra)               | Deploy a list of Kubernetes resources as a release with [bitnami/common][bitnami/common] as a dependency |
| [jouve/hnc](charts/hnc)                   | [Hierarchical Namespace Controller][hnc]. Policies and delegated creation to Kubernetes namespaces       |
| [jouve/mailpit](charts/mailpit)           | Deploy [mailpit][mailpit]: An email and SMTP testing tool with API for developers                        |
| [jouve/postgresql](charts/postgresql)     | Deploy postgresql using [cloudnative-pg][cloudnative-pg] operator                                        |
| [jouve/subnamespace](charts/subnamespace) | SubnamespaceAnchor is the Schema for the [subnamespace][hnc] API                                         |

[bitnami/common]: https://github.com/bitnami/charts/tree/main/bitnami/common
[cloudnative-pg]: https://cloudnative-pg.io/
[hnc]: https://github.com/kubernetes-sigs/hierarchical-namespaces
[mailpit]: https://github.com/axllent/mailpit
