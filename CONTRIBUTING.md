# Contributing

Every contribution helps, including a typo fix, a bug report, a missing snippet, or a question about how something works. For anything bigger than a small fix, opening an issue first is a good idea, so we can agree on the approach before you spend time on it.

## Setup

```bash
git clone https://github.com/wielorzeczownik/zed-volt.git
```

In Zed, open the command palette, run `zed: install dev extension` and pick the cloned directory. Zed fetches the grammar and compiles it. After changing a query or a snippet, run `zed: reload extensions`.

Highlight captures have to be names Zed themes know (`@keyword`, `@function.method`, `@variable.parameter` and so on), otherwise the text stays uncolored.

## Checks

CI runs these on every pull request. You don't have to run them all locally, since CI will point out anything that's off:

```bash
scripts/check-queries.sh
shfmt --diff scripts/
shellcheck scripts/*.sh
actionlint
markdownlint-cli2 "**/*.md" "!CHANGELOG.md"
npx prettier --check .
```

## Tests

`scripts/check-queries.sh` runs the queries against `tests/sample.volt`. When you change a query, add the syntax it targets to that file.

## Commits and pull requests

Commits follow [Conventional Commits](https://www.conventionalcommits.org/) (`feat: ...`, `fix: ...`), because the changelog and version bumps are generated from them. Don't worry if you get the prefix wrong, it can be fixed before merging.

Smaller PRs that do one thing are easier to review. If something is highlighted wrong, the smallest template that shows it helps a lot, in an issue or a PR.

Bugs and ideas go to [issues](https://github.com/wielorzeczownik/zed-volt/issues). Security problems go through [SECURITY.md](SECURITY.md).

Contributions are licensed under the [MIT License](LICENSE).
