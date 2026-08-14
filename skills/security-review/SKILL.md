---
name: security-review
description: Use when reviewing code, configs, dependencies, secrets, auth, permissions, logging, or data flows for security and privacy risks.
---

# Security Review

Use this skill for focused security and privacy review of changes or existing code.

## Scope Triage

Identify whether the work touches:

- Authentication, authorization, sessions, tokens, or cookies.
- Secret handling, environment variables, credentials, or key material.
- User input, file uploads, parsing, templating, serialization, or shell execution.
- Database queries, migrations, object storage, queues, or caches.
- Network calls, webhooks, CORS, CSP, redirects, or SSRF-relevant paths.
- Logging, analytics, telemetry, exports, backups, or personally identifiable information.
- Dependency updates, package scripts, container images, or CI credentials.

## Review Workflow

1. Map entry points, trust boundaries, sensitive data, and privileged operations.
2. Check whether authorization is enforced server-side and close to the protected operation.
3. Look for injection risks in SQL, shell, paths, templates, LDAP, XML, YAML, and eval-like APIs.
4. Verify secrets are not committed, logged, exposed to clients, or passed to untrusted subprocesses.
5. Inspect error handling and logs for sensitive data leakage.
6. Review dependency and build-script changes for supply-chain risk.
7. Recommend precise fixes and tests for each material issue.

## Output

Lead with exploitable or high-impact findings. Include file and line references when available, describe the attack or leakage path, and give a concrete remediation direction.

Do not present a clean bill of health if important areas could not be inspected.
