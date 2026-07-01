# ADR-006: Local Platform Architecture

## Status

Accepted

---

## Context

The platform has evolved from a project vision into a working Kubernetes environment running a stateful database and a Go-based API.

As additional components are introduced, the platform requires a clear architectural structure that supports maintainability, scalability, and future production deployment.

Rather than organising the repository around individual technologies, the platform is organised around engineering responsibilities.

---

## Decision

The platform adopts a layered cloud-native architecture with clearly separated responsibilities.

### Local Kubernetes Platform

Kind is used as the local Kubernetes platform.

Reasons:

- Fast cluster creation
- Lightweight development environment
- Fully reproducible
- Compatible with Docker
- Ideal for local platform engineering

Future production deployments will target AWS-managed infrastructure.

---

### Repository Structure

The repository is organised by platform responsibility rather than by file type.

Examples include:

- api/
- kubernetes/
- docs/
- scripts/
- terraform/
- monitoring/
- kind/

This keeps infrastructure, applications, automation, and documentation logically separated.

---

### Namespace Strategy

Kubernetes workloads are isolated into dedicated namespaces.

Current namespaces include:

- app
- platform
- monitoring
- ingress

Separating workloads improves organisation and prepares the platform for future growth.

---

### Application Architecture

Different Kubernetes resources are selected according to workload characteristics.

The Go API is deployed as a Deployment because it is stateless and can be horizontally scaled.

MongoDB is deployed as a StatefulSet because it requires persistent storage and a stable network identity.

---

### Networking

Application components communicate through Kubernetes Services and internal DNS.

No application depends on fixed pod IP addresses.

This aligns with Kubernetes networking best practices.

---

### Development Strategy

The platform is built incrementally.

Each phase introduces one major capability before moving to the next.

Completed phases include:

- Local Kubernetes platform
- Namespace architecture
- MongoDB StatefulSet
- Persistent storage
- Secrets management
- Go API deployment

Upcoming phases include:

- Ingress routing
- Monitoring
- CI/CD
- AWS infrastructure
- Helm packaging

---

## Consequences

### Benefits

- Clear separation of concerns
- Easier maintenance
- Improved scalability
- Better documentation
- Production-inspired architecture
- Easier onboarding for future contributors

### Trade-offs

- More directories than a small application
- Additional documentation effort
- Slower initial development in exchange for a stronger engineering foundation

---

## Rationale

This architecture reflects how modern cloud-native platforms are designed.

The project prioritises engineering practices, documentation, reproducibility, and operational thinking alongside application development.

The resulting platform demonstrates not only how workloads are deployed, but also why architectural decisions were made.
