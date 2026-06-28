# ADR-004: Persistent Storage Strategy

Status

Accepted

## Context

Containers are ephemeral.

Deleting a MongoDB pod would normally delete its data.

## Decision

PersistentVolumeClaims will be attached to every MongoDB pod.

## Rationale

Persistent storage allows the database to recover after pod recreation.

Each StatefulSet replica receives its own dedicated storage.

## Benefits

- Data persistence
- Improved resilience
- Easier recovery

## Trade-offs

Storage lifecycle must be managed.
