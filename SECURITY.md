# Security Policy

## Supported versions

Only the latest release receives security fixes.

## Reporting a vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Report vulnerabilities privately via [GitHub Security Advisories](https://github.com/wielorzeczownik/zed-volt/security/advisories/new).

Include as much detail as possible:

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

You will receive a response within **7 days**. If the issue is confirmed, a fix will be released as soon as possible and you will be credited in the release notes (unless you prefer to remain anonymous).

## Scope

The extension contains no executable code of its own. It ships configuration only: a pinned tree-sitter grammar that Zed compiles to WebAssembly and runs in its sandbox, highlight and bracket queries, and snippets. The attack surface includes:

- the grammar source pinned in `extension.toml`
- queries in `languages/volt/` and snippets in `snippets/volt.json`

Vulnerabilities in Zed itself or in the upstream [tree-sitter-twig](https://github.com/gbprod/tree-sitter-twig) grammar are out of scope. Report them to those projects.
