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

## Architecture Decision Records

This repository documents important engineering decisions using Architecture Decision Records (ADRs).

Current ADRs include:

- ADR-001 – Project Vision
- ADR-002 – MongoDB Deployment Strategy
- ADR-003 – Headless Service for MongoDB
- ADR-004 – Persistent Storage Strategy
- ADR-005 – Secrets Management
- ADR-006 – Local Platform Architecture

Each ADR captures the context, decision, rationale, and consequences behind significant architectural choices, providing a documented history of how the platform evolved.

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

## Roadmap

### Phase 1
- ✅ Repository organization
- ✅ Documentation
- ✅ Platform architecture

### Phase 2
- ✅ Kind Kubernetes cluster
- ✅ Namespaces
- ✅ NGINX Ingress Controller installation

### Phase 3
- ✅ MongoDB StatefulSet
- ✅ Persistent storage
- ✅ Kubernetes Secret
- ✅ Headless Service

### Phase 4
- ✅ Go API
- ✅ Docker image
- ✅ Kubernetes Deployment
- ✅ Kubernetes Service
- ✅ MongoDB connectivity

### Phase 5 (Current)
- ⏳ NGINX Ingress routing
- ⏳ Path-based routing
- ⏳ Remove dependency on `kubectl port-forward`
- ⏳ Public HTTP access
- ⏳ End-to-end request flow

### Phase 6
- ⏳ Prometheus
- ⏳ Grafana
- ⏳ Kubernetes metrics
- ⏳ Operational dashboards

### Phase 7
- ⏳ GitHub Actions
- ⏳ Automated Docker builds
- ⏳ Kubernetes deployment pipeline

### Phase 8
- ⏳ Terraform infrastructure
- ⏳ AWS deployment
- ⏳ Production-ready cloud platform

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

---

# Screenshots

The following screenshots document the evolution of the platform from infrastructure provisioning to a running cloud-native application.

---

## Repository Structure

The repository is organised into separate directories for application code, Kubernetes manifests, infrastructure, documentation, automation scripts, and supporting assets.

This separation follows Platform Engineering principles by keeping responsibilities clearly defined and making the repository easier to maintain as it grows.

**Screenshot**

<img width="869" height="83" alt="repo-structure" src="https://github.com/user-attachments/assets/21c2d52f-5c44-4348-a68d-ce8b81c95f07" />

---

## Kubernetes Cluster

**Command**

```bash
kubectl get nodes
```

This confirms that the Kubernetes cluster is operational and that the control-plane node is in the **Ready** state.

**Screenshot**

<img width="548" height="42" alt="kubernetes-cluster" src="https://github.com/user-attachments/assets/f8d1c58a-c145-4f26-9f8a-d921d6556a4c" />

---

## Kubernetes Namespaces

**Command**

```bash
kubectl get namespaces
```

The platform is divided into dedicated namespaces (`app`, `platform`, `monitoring`, and `ingress`) to isolate workloads and prepare the cluster for future expansion.

Namespace separation improves organisation, security, and operational management.

**Screenshot**

<img width="571" height="171" alt="kubernetes-namespaces" src="https://github.com/user-attachments/assets/b73da4a3-9a28-4ff4-bcad-2cfc15eafc55" />

---

## Kubernetes Application Resources

**Command**

```bash
kubectl get all -n app
```

This demonstrates the complete application stack running inside Kubernetes, including:

- Deployment
- StatefulSet
- ReplicaSet
- Pods
- Services

Together these resources form the application's runtime environment.

**Screenshot**

<img width="611" height="252" alt="kubernetes-app-resources" src="https://github.com/user-attachments/assets/243b44cb-ce7e-4f37-9598-c0be4e8311a7" />

---

## Persistent Storage

**Command**

```bash
kubectl get pvc -n app
```

MongoDB is deployed using a StatefulSet with a PersistentVolumeClaim (PVC).

The PVC ensures application data persists even if the MongoDB pod is recreated.

This is an essential characteristic of stateful workloads running on Kubernetes.

**Screenshot**

<img width="944" height="72" alt="storage" src="https://github.com/user-attachments/assets/7282311d-5bf4-474c-97f5-65029cbbfa8b" />

---

## Kubernetes Services

**Command**

```bash
kubectl get svc -n app
```

Kubernetes Services provide stable networking and service discovery for the application.

The Go API communicates with MongoDB through Kubernetes DNS rather than fixed IP addresses, allowing pods to be recreated without breaking application connectivity.

**Screenshot**

<img width="574" height="58" alt="kubernetes-services" src="https://github.com/user-attachments/assets/be830512-d192-4a1b-a271-5d3318aa685b" />

---

## Application Logs

**Command**

```bash
kubectl logs deployment/voting-api -n app
```

The application logs confirm that the Go API successfully connects to MongoDB during startup.

This verifies that:

- Kubernetes Secrets are injected correctly
- DNS resolution is functioning
- Service discovery is working
- Network communication between application components is successful

**Screenshot**

<img width="707" height="43" alt="app-logs" src="https://github.com/user-attachments/assets/6b3ce63e-c49e-460b-a172-d340a1480aa2" />

---

## Browser Verification

The application's health endpoint is successfully accessed through the browser using Kubernetes port forwarding.

**URL**

```
http://localhost:8080/health
```

**Expected Response**

```
API is running
```

This confirms successful end-to-end communication from the client to the Go API running inside Kubernetes.

**Screenshot**

<img width="368" height="103" alt="app-running" src="https://github.com/user-attachments/assets/775f2097-f1ba-4bae-ad60-fcf8edc31da3" />

---

## Platform Summary

At this stage the platform successfully demonstrates:

- Kubernetes cluster provisioning using Kind
- Namespace isolation
- Stateful MongoDB deployment
- Persistent storage with PersistentVolumeClaims
- Secure credential management using Kubernetes Secrets
- Internal service discovery using Kubernetes Services
- Go API deployment
- Containerisation with Docker
- End-to-end communication between the API and MongoDB
- Successful application verification through the browser

This milestone establishes a solid foundation for the next phases of the project, including Ingress routing, frontend integration, monitoring, CI/CD automation, and cloud deployment on AWS.

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


Cloud | DevOps | Kubernetes

KCNA – Kubernetes and Cloud Native Associate

AWS Cloud Practitioner (CLF-C02) Training
