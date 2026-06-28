# ADR-005: Secrets Management

Status

Accepted

## Context

Applications require credentials such as database usernames and passwords.

## Decision

Sensitive values will be stored in Kubernetes Secrets.

## Rationale

Secrets separate confidential information from application manifests.

## Benefits

- Better security
- Easier credential rotation
- Cleaner manifests

## Trade-offs

Secrets should be encrypted at rest in production.
