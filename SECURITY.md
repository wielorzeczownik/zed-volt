# Security

Thanks for taking the time to look. Please report vulnerabilities privately through [GitHub Security Advisories](https://github.com/wielorzeczownik/zed-volt/security/advisories/new) instead of a public issue, so there's a chance to fix them first. You'll be credited in the release notes unless you'd rather not be. Only the latest release gets fixes.

## In scope

The extension has no executable code of its own. It ships a pinned tree-sitter grammar that Zed compiles to WebAssembly and runs in its sandbox, plus queries and snippets. So the scope is:

- the grammar source pinned in `extension.toml`
- the queries in `languages/volt/` and the snippets in `snippets/volt.json`

Problems in Zed itself or in the upstream [tree-sitter-twig](https://github.com/gbprod/tree-sitter-twig) grammar belong to those projects.
