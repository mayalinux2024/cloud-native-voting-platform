# Cloud-Native Platform Engineering Lab

## Platform Layers

Local Development Layer
    ↓
WSL (Ubuntu)

Infrastructure Layer
    ↓
Terraform

Compute Layer
    ↓
AWS EC2 (later phase)

Container Runtime
    ↓
Docker

Container Orchestration
    ↓
Kubernetes (Kind locally)

Namespaces
    ├── platform
    ├── app
    ├── monitoring
    └── ingress

Application Layer
    ├── React Frontend
    ├── Go API
    └── MongoDB Replica Set

Operations Layer
    ├── Logging
    ├── Monitoring
    ├── Health Checks
    └── Troubleshooting

Delivery Layer
    ↓
GitHub Actions CI/CD

Documentation Layer
    ├── ADRs
    ├── Runbooks
    ├── Architecture
    ├── Cost Documentation
    └── Security Documentation
