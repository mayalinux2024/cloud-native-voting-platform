ADR-001: Project Vision — Cloud-Native Platform Engineering Lab
Status

Accepted

Context

Modern cloud engineering roles require more than application deployment skills. Engineers are expected to understand infrastructure design, system reliability, scalability, and operational trade-offs.

Most portfolio projects focus only on application deployment (e.g., deploying a simple web app on Kubernetes). These projects do not demonstrate understanding of architecture decisions, operational thinking, or production constraints.

This project is designed to simulate a real-world platform engineering environment where infrastructure, application deployment, and operational practices are treated as a unified system.

Decision

We will build a Cloud-Native Platform Engineering Lab, where:

Kubernetes is used as the core orchestration system
The application (voting system) is treated as a workload, not the main focus
Infrastructure decisions are documented using ADRs
Local development is prioritized using Kind before any cloud deployment
AWS is used only when necessary for production simulation and validation
Terraform is used for infrastructure provisioning (later phase)
CI/CD and observability are treated as first-class components

The system is designed to evolve in phases rather than being built all at once.

Consequences
Positive
Strong alignment with real Platform Engineering roles
Demonstrates system design thinking instead of only deployment skills
Encourages documentation of architectural reasoning (ADRs)
Reduces cloud cost during development (local-first approach)
Easier iteration and debugging using local Kubernetes (Kind)
Trade-offs
Slower initial progress compared to direct cloud deployment
Requires discipline in documentation
More upfront design effort before writing Kubernetes manifests
Rationale

This approach reflects real-world platform engineering practices where systems are:

Designed before implementation
Documented for maintainability
Built in stages
Tested locally before production deployment
Notes

This ADR establishes the foundation for all future architectural decisions in this project.
