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

## Platform Overview

The project is organized into several logical layers. Each layer has a distinct responsibility and can evolve independently.

---

## 1. Local Development

- WSL (Ubuntu)
- Git
- kubectl
- Terraform CLI

Purpose:

Provides a reproducible development environment for building and testing the platform.

---

## 2. Provisioning

- Terraform

Purpose:

Defines cloud infrastructure as code for future AWS deployments.

---

## 3. Infrastructure

- AWS EC2 (future phase)

Purpose:

Hosts the platform infrastructure when deploying outside the local environment.

---

## 4. Container Runtime

- Docker

Purpose:

Builds and runs application containers.

---

## 5. Container Orchestration

- Kind (local Kubernetes)

Namespaces:

- platform
- app
- monitoring
- ingress

Purpose:

Provides Kubernetes orchestration for local platform development.

---

## 6. Application Layer

Components:

- React Frontend
- Go API
- MongoDB Replica Set

Purpose:

Hosts the business application.

---

## 7. Operations

Components:

- Monitoring
- Logging
- Health Checks
- Troubleshooting

Purpose:

Provides operational visibility into the platform.

---

## 8. Delivery

- GitHub Actions

Purpose:

Automates testing and deployment workflows.

---

## 9. Documentation

Includes:

- Architecture
- ADRs
- Runbooks
- Cost Strategy
- Security Documentation

Purpose:

Captures architectural decisions and operational knowledge.
