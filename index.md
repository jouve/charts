---
title: jouve/charts
---

# usage

```console
helm repo add jouve https://jouve.github.io/charts/
```

# charts

| chart                          | description                                                                                                                                          |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [jouve/extra](charts/extra)    | Deploy a list of Kubernetes resources as a release with [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common) as a dependency.|
| [jouve/mailpit][mailpit]       | Deploy [mailpit](https://github.com/axllent/mailpit): An email and SMTP testing tool with API for developers                                         |
| [jouve/postgresql][postgresql] | Deploy postgresql using [cloudnative-pg](https://cloudnative-pg.io/) operator                                                                        |

[extra]: https://github.com/jouve/charts/tree/main/charts/extra
[mailpit]: https://github.com/jouve/charts/tree/main/charts/mailpit
[postgresql]: https://github.com/jouve/charts/tree/main/charts/postgresql
