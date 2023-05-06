# Tools

- [Tools](#tools)
  - [Static Code Analysis](#static-code-analysis)
  - [Secret Scanner](#secret-scanner)
  - [Pre commit hooks](#pre-commit-hooks)

## Static Code Analysis

### Analyzer & Flutter Lint

- We rely heavily on [Analyzer](https://pub.dev/packages/analyzer) for linting and make use of [Flutter Lint](https://pub.dev/packages/flutter_lints) for a linting rules.
  **Setup**: At root, We have a `analysis_options.yaml` to setup linting rules for analyzer. For more linting rules refer official [doc](https://dart.dev/tools/linter-rules).

### Flutter Format
- Flutter by default supports command `flutter format` automatic formatting.

## Secret Scanner

- Talisman is a tool that installs a hook to your repository to ensure that potential secrets or sensitive information do not leave the developer's workstation. It validates the outgoing changeset for things that look suspicious - such as potential SSH keys, authorization tokens, private keys etc.
- To add talisman in pre-commit hook, you can run `make precommit`
- We can add the false positive secrets detected by secret scanner in `.talismanrc` file
- Learn more about [git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)

## Pre commit hooks

- Pre commit hooks are by default enabled in this starter kit.
- Currently, pre-commit hooks invokes talisman, analyzer, format, and test.
- `make bootstrap` command automatically setup pre-commit hooks
