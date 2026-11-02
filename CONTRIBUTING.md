# Contributing to Volt for Zed

Thank you for considering a contribution. This document covers everything you need to get started.

## Overview

A [Zed](https://zed.dev) extension that adds syntax highlighting and snippets for [Phalcon Volt](https://docs.phalcon.io/latest/volt/) templates. It reuses the [tree-sitter-twig](https://github.com/jannisborgers/tree-sitter-twig) grammar and contains no executable code.

## Project structure

```text
.
├── extension.toml            extension manifest and the pinned grammar commit
├── languages/volt/
│   ├── config.toml           file suffixes, brackets, comments
│   ├── highlights.scm        highlight captures
│   ├── injections.scm        HTML injection for template content
│   └── brackets.scm          bracket pairs for matching
├── snippets/volt.json        snippets following the Volt documentation
├── tests/sample.volt         template the queries are checked against in CI
└── scripts/
    ├── bump-version.sh       determines the next release version from git-cliff and bumps extension.toml
    └── check-queries.sh      checks the queries against the grammar pinned in extension.toml
```

## Development setup

```bash
git clone https://github.com/wielorzeczownik/zed-volt.git
```

In Zed, open the command palette, run `zed: install dev extension` and select the cloned directory. Zed fetches the grammar and compiles it. After changing a query or a snippet, run `zed: reload extensions`.

Highlight captures must be names that Zed themes know (`@keyword`, `@function.method`, `@variable.parameter` and so on), otherwise the matched text stays uncolored.

## Running checks locally

### With tools installed locally

```bash
# Queries against the pinned grammar
scripts/check-queries.sh

# Shell
shfmt --diff scripts/
shellcheck scripts/*.sh

# GitHub Actions workflows
actionlint

# Markdown
markdownlint-cli2 "**/*.md" "!CHANGELOG.md"

# YAML, JSON and Markdown formatting
npx prettier --check .
```

### With Docker (no local installs required)

```bash
docker run --rm -v "$(pwd):/src" -w /src mvdan/shfmt --diff scripts/

docker run --rm -v "$(pwd):/src" -w /src rhysd/actionlint

docker run --rm -v "$(pwd):/workdir" davidanson/markdownlint-cli2 "**/*.md" "!CHANGELOG.md"
```

## Commit style

This project uses [Conventional Commits](https://www.conventionalcommits.org/). Commit messages drive automatic changelog generation and version bumping. A commit message is a single line with no body.

Common prefixes:

| Prefix      | When to use                              |
| ----------- | ---------------------------------------- |
| `feat:`     | New snippet, query or language feature   |
| `fix:`      | Bug fix, wrong highlight, broken snippet |
| `test:`     | Changes to `tests/sample.volt`           |
| `chore:`    | Maintenance, dependency updates          |
| `refactor:` | Change without behavior change           |
| `docs:`     | Documentation only                       |
| `style:`    | Formatting, no logic change              |
| `ci:`       | CI/CD changes                            |

Breaking changes must include `BREAKING CHANGE:` in the commit footer.

## Pull requests

- Keep PRs focused on a single concern.
- Reference any related issue in the PR description.
- When a query changes, extend `tests/sample.volt` with the syntax it targets.
- All CI checks must pass: query validation, shell linting, workflow linting, Markdown linting and formatting.

## Reporting bugs

Open an [issue](https://github.com/wielorzeczownik/zed-volt/issues) and include:

- What you did
- What you expected
- What actually happened
- The smallest template sample that shows the problem
- Your Zed and extension versions

> For security issues, please read [SECURITY.md](SECURITY.md) before opening a public issue.

## License

By contributing you agree that your changes will be licensed under the [MIT License](LICENSE).
