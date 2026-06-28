# ADR-003: Headless Service for MongoDB

Status

Accepted

## Context

MongoDB replicas need to communicate directly with one another.

## Decision

A Headless Service will be used.

## Rationale

Unlike a normal Service, a Headless Service does not load balance requests.

Instead, Kubernetes DNS returns the IP address of each individual pod.

This allows each MongoDB replica to be reached directly.

## Benefits

- Stable DNS names
- Replica discovery
- Required for StatefulSet networking

## Trade-offs

No built-in load balancing.
