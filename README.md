<h1 align="center">Volt for Zed</h1>

<p align="center">
  <a href="https://github.com/wielorzeczownik/zed-volt/actions/workflows/release.yml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/github/actions/workflow/status/wielorzeczownik/zed-volt/release.yml?branch=main&style=flat-square&labelColor=2d333b&color=3fb950"/><source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/github/actions/workflow/status/wielorzeczownik/zed-volt/release.yml?branch=main&style=flat-square&color=2ea043"/><img src="https://img.shields.io/github/actions/workflow/status/wielorzeczownik/zed-volt/release.yml?branch=main&style=flat-square&labelColor=2d333b&color=3fb950" alt="release"/></picture></a> <a href="https://github.com/wielorzeczownik/zed-volt/releases/latest"><picture><source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/github/v/release/wielorzeczownik/zed-volt?style=flat-square&labelColor=2d333b&color=3fb950"/><source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/github/v/release/wielorzeczownik/zed-volt?style=flat-square&color=2ea043"/><img src="https://img.shields.io/github/v/release/wielorzeczownik/zed-volt?style=flat-square&labelColor=2d333b&color=3fb950" alt="Latest Release"/></picture></a> <a href="https://github.com/wielorzeczownik/zed-volt/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/License-MIT-3fb950?style=flat-square&labelColor=2d333b"/><source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/License-MIT-2ea043?style=flat-square"/><img src="https://img.shields.io/badge/License-MIT-3fb950?style=flat-square&labelColor=2d333b" alt="License: MIT"/></picture></a>
  <br/>
  <img src="https://img.shields.io/badge/Zed-084CCF?style=flat-square&logo=zedindustries&logoColor=white" alt="Zed"/> <img src="https://img.shields.io/badge/Tree--sitter-1B1F24?style=flat-square&logo=treesitter&logoColor=white" alt="Tree-sitter"/>
</p>

A [Zed](https://zed.dev) extension that adds syntax highlighting and snippets for [Phalcon Volt](https://docs.phalcon.io/latest/volt/) templates (`.volt`).

Volt is close enough to Twig that the extension reuses the [tree-sitter-twig](https://github.com/gbprod/tree-sitter-twig) grammar. HTML inside templates is highlighted through injection.

## Installation

### From the Zed extension registry

1. Open the extensions panel with `zed: extensions`.
2. Search for **Volt**.
3. Click **Install**.

Files ending in `.volt` are recognized automatically.

### From source

```bash
git clone https://github.com/wielorzeczownik/zed-volt.git
```

Then run `zed: install dev extension` in Zed and select the cloned directory.

## Limitations

- The grammar is Twig's, so statements that exist only in Volt (`switch`, `case`, `elsefor`, `return`) are parsed as generic tags. They are colored as tags, not as keywords like `if` and `for`.
- Volt syntax that Twig lacks, such as a loop filter (`{% for item in items if item.active %}`) or array keys with a colon (`['k': 1]`), produces a parse error. Highlighting around it can be off.
- The extension has no language server, there is no completion of controller variables, no diagnostics and no go to definition.

## Credits

- Grammar: [tree-sitter-twig](https://github.com/gbprod/tree-sitter-twig) by gbprod
- Extension layout based on [zed-twig](https://github.com/YussufSassi/zed-twig) by Yussuf Sassi
- Snippets initially based on [vscode-language-volt](https://github.com/fbclol/vscode-language-volt) (MIT, (c) 2020 fbclol)
