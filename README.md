# pre-commit

Pre-commit scripts appropriate for my applications.

# Setup

See [Add custom plugins to my projects](https://pre-commit.com/index.html#plugins)

# Supported Hooks

## Pint subdir

```yaml
- repo: https://github.com/luis-knd/pre-commit
  rev: 0.0.1
  hooks:
    - id: pint-subdir
      files: '^SUBDIR/.*\.php'
      args: ['SUBDIR']

```
run Pint in a laravel application in a subdirectory


## phpstan-subdir

```yaml
- repo: https://github.com/luis-knd/pre-commit
  rev: 0.0.1
  hooks:
    - id: phpstan-subdir
      files: '^SUBDIR/.*\.php'
      args: ['SUBDIR']

```
run Phpstan in a PHP application in a subdirectory

