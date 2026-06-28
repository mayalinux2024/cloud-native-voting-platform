# ADR-002: MongoDB Deployment Strategy

Status

Accepted

## Context

The voting application requires a database that preserves data across pod restarts.

MongoDB stores persistent data and each database instance must retain its own identity and storage.

## Decision

MongoDB will be deployed using a StatefulSet.

## Rationale

StatefulSet provides:

- Stable pod names
- Stable network identities
- Ordered startup and shutdown
- Persistent storage per replica
- Reliable database recovery

A Deployment was rejected because pods are interchangeable and may receive different names after recreation.

## Consequences

Benefits

- Supports database replication
- Data survives pod rescheduling
- Predictable pod naming

Trade-offs

- Slightly more complex than a Deployment
- Requires additional Kubernetes resources
