                   GitHub
                      │
                      │
              GitHub Actions
                      │
                      ▼
          Kubernetes Cluster (Kind)

 ┌───────────────────────────────────────┐
 │              platform                 │
 │   Infrastructure Components           │
 └───────────────────────────────────────┘

 ┌───────────────────────────────────────┐
 │                app                    │
 │                                       │
 │ React Frontend                        │
 │        │                              │
 │        ▼                              │
 │     Go API                            │
 │        │                              │
 │        ▼                              │
 │ MongoDB Replica Set                   │
 └───────────────────────────────────────┘

 ┌───────────────────────────────────────┐
 │            monitoring                 │
 │ Prometheus                            │
 │ Grafana                               │
 └───────────────────────────────────────┘

 ┌───────────────────────────────────────┐
 │              ingress                  │
 │ Ingress Controller                    │
 └───────────────────────────────────────┘
