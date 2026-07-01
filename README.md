# Cloud-Native Voting Platform

> A production-style cloud-native application built to demonstrate Platform Engineering, Kubernetes, Infrastructure as Code, and modern DevOps practices.

---

# Project Overview

This project demonstrates how to design, build, and operate a cloud-native application using modern Platform Engineering practices.

Rather than simply deploying containers, the project focuses on the complete engineering lifecycle:

- Infrastructure as Code
- Kubernetes architecture
- Stateful workloads
- Containerized applications
- Platform organization
- Networking
- Production-oriented engineering decisions
- CI/CD automation (planned)
- Monitoring and observability (planned)

The long-term goal is to evolve this repository into a realistic cloud-native platform that resembles how applications are deployed and operated in production.

---

# Current Architecture

```
                Browser / curl
                       │
                       ▼
        kubectl port-forward (Development)
                       │
                       ▼
        Kubernetes Service (ClusterIP)
               voting-api
                       │
                       ▼
               Go API Pod
                       │
                       ▼
          MongoDB StatefulSet
             mongodb-0
                       │
                       ▼
          Persistent Volume Claim
             local-path Storage
```

---

# Current Platform Status

The platform currently includes:

- ✅ Kind Kubernetes Cluster
- ✅ Kubernetes Namespaces
- ✅ MongoDB StatefulSet
- ✅ Persistent Volume
- ✅ Kubernetes Secret
- ✅ Headless Service
- ✅ Go REST API
- ✅ Docker Image
- ✅ Kubernetes Deployment
- ✅ Kubernetes Service
- ✅ API successfully connected to MongoDB

---

# Technology Stack

## Cloud

- AWS (planned deployment)

## Infrastructure as Code

- Terraform

## Container Runtime

- Docker

## Container Orchestration

- Kubernetes
- Kind

## Backend

- Go

## Database

- MongoDB

## Version Control

- Git
- GitHub

## Future Platform Components

- React
- NGINX Ingress Controller
- Helm
- Prometheus
- Grafana
- GitHub Actions

---

# Repository Structure

```text
cloud-native-voting-platform/

├── api/
│   └── go/
│
├── kubernetes/
│   ├── app/
│   │   ├── api/
│   │   ├── frontend/
│   │   └── mongodb/
│   │
│   ├── namespaces/
│   ├── ingress/
│   ├── monitoring/
│   └── platform/
│
├── terraform/
├── kind/
├── scripts/
├── docs/
├── screenshots/
└── README.md
```

---

# Engineering Decisions

This repository intentionally follows Platform Engineering principles rather than only demonstrating Kubernetes syntax.

Some important architectural decisions include:

## Namespace Isolation

Separate namespaces are used for:

- app
- platform
- monitoring
- ingress

This keeps workloads isolated and prepares the platform for future expansion.

---

## MongoDB as a StatefulSet

MongoDB is deployed using a StatefulSet instead of a Deployment because databases require:

- stable identities
- persistent storage
- predictable pod names
- ordered startup

This matches Kubernetes best practices for stateful applications.

---

## Persistent Storage

A PersistentVolumeClaim is used so application data survives pod restarts.

Without persistent storage, deleting a MongoDB pod would also delete all stored data.

---

## Kubernetes Secrets

Database credentials are stored inside Kubernetes Secrets instead of hardcoding them inside application manifests.

This separates sensitive configuration from application code.

---

## Go Backend

The API is implemented in Go because it offers:

- fast startup
- low memory usage
- excellent Kubernetes ecosystem support
- simple deployment as a static binary

---

# Lessons Learned

Building this platform reinforced several important Kubernetes concepts.

## Kubernetes is Declarative

Instead of manually configuring infrastructure, Kubernetes continuously works to make the cluster match the desired state described in YAML manifests.

---

## Stateless vs Stateful Workloads

Application pods can be recreated at any time.

Databases require stable identities and persistent storage.

Understanding this distinction is fundamental when designing Kubernetes applications.

---

## Services Provide Stable Networking

Pods are temporary.

Services provide a permanent network endpoint that applications can rely on even when pods are recreated.

---

## Secrets Should Never Be Hardcoded

Sensitive information belongs in Kubernetes Secrets rather than application source code or deployment manifests.

---

## Small Git Commits Improve Project History

The repository has been developed through small, logical commits.

This makes the project's evolution easier to understand and mirrors collaborative software development practices.

---

# Roadmap

## Phase 1

- ✅ Repository organization
- ✅ Documentation
- ✅ Platform architecture

---

## Phase 2

- ✅ Kind Kubernetes cluster
- ✅ Namespaces
- ✅ NGINX Ingress installation

---

## Phase 3

- ✅ MongoDB StatefulSet
- ✅ Persistent storage
- ✅ Kubernetes Secret
- ✅ Headless Service

---

## Phase 4

- ✅ Go API
- ✅ Docker image
- ✅ Kubernetes Deployment
- ✅ Kubernetes Service
- ✅ MongoDB connectivity

---

## Phase 5 (Next)

- ⏳ NGINX Ingress routing
- ⏳ Public HTTP access
- ⏳ End-to-end request flow

---

## Future Phases

- Prometheus
- Grafana
- Helm
- GitHub Actions
- Terraform deployment to AWS
- Amazon EKS
- Horizontal Pod Autoscaler
- Logging
- Production security improvements

---

# Screenshots

The repository includes screenshots documenting the platform as it evolves.

Suggested order:

1. Repository structure
2. Kubernetes cluster
3. Namespaces
4. Running workloads
5. Persistent Volume Claim
6. Services
7. Application logs
8. Browser showing the running API

Each screenshot demonstrates an engineering milestone rather than simply showing command output.

---

# Current Verification

The following checks currently succeed:

```bash
kubectl get nodes

kubectl get namespaces

kubectl get all -n app

kubectl get pvc -n app

kubectl logs deployment/voting-api -n app
```

The Go API successfully connects to MongoDB and serves HTTP requests.

---

# Next Milestone

The next engineering milestone is replacing temporary port-forwarding with an NGINX Ingress so the application can be accessed through standard HTTP routing inside Kubernetes.

---

# Author

**Maya Elfeky**

Cloud & DevOps Engineer

AWS Certified Cloud Practitioner

KCNA – Kubernetes and Cloud Native Associate
