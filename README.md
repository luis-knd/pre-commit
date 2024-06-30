# Pre-commit

This repository uses the [pre-commit framework](https://pre-commit.com/index.html) to manage and maintain Git pre-commit hooks. 
Pre-commit hooks are scripts that run automatically before a commit is finalized. They help ensure code quality by 
catching issues early and enforcing coding standards.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Setup](#project-setup)
- [More Information](#more-information)
- [Contributing](#contributing)

## Prerequisites

Ensure you have the following installed:
- [Python 3.6+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/)

## Project Setup

1. **Install pre-commit:**
    - **Using Ubuntu, Linux Mint or similar distribution with `APT`** 
    ```bash
   sudo apt install pre-commit
   ```
    - **Using Python**
    ```bash
   pip install pre-commit
   ```

2. **Validated the correct instalation**, run this command:
    ```bash
   pre-commit --version
   ```

   The result have been similar to:
    ```text
    pre-commit 2.17.0
    ```
   
3. **Add pre-commit configuration.**
   In the repository where you need install the pre-commit, you need to create a `.pre-commit-config.yaml`.

   This is an example file using:
   - [Trims trailing whitespace](https://github.com/pre-commit/pre-commit-hooks?tab=readme-ov-file#trailing-whitespace)
   - [Check Merge Conflict](https://github.com/pre-commit/pre-commit-hooks?tab=readme-ov-file#check-merge-conflict)
   - [Check Json File](https://github.com/pre-commit/pre-commit-hooks?tab=readme-ov-file#check-json)
   - [Check XML File](https://github.com/pre-commit/pre-commit-hooks?tab=readme-ov-file#check-xml)
   - [Check YAML File](https://github.com/pre-commit/pre-commit-hooks?tab=readme-ov-file#check-yaml)
   - [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)
   - [PHP Code Beautifier and Fixer](https://phpqa.io/projects/phpcbf.html)
   - [PHPStan](https://phpstan.org/)
   
   ```yaml
   repos:
   - repo: https://github.com/pre-commit/pre-commit-hooks
     rev: v4.4.0
     hooks:
       - id: trailing-whitespace
       - id: check-merge-conflict
       - id: check-json
       - id: check-xml
       - id: check-yaml
         files: \.(yaml|yml)$

   - repo: https://github.com/digitalpulp/pre-commit-php.git
     rev: 1.4.0
     hooks:
       - id: php-lint

   - repo: https://github.com/luis-knd/pre-commit
     rev: v0.0.2
     hooks:
       - id: install-dependencies
       - id: phpcs-subdir
         args: [
         'src',
         '--report=code',
         '--colors',
         '--report-width=80',
         '--standard=PSR12',
         '--ignore= src/vendor, src/storage, src/bootstrap, src/resources, src/tests, src/public, src/config, src/app/Helpers/helpers, bin'
         ]
       - id: phpcbf-subdir
         args: [
         'src',
         '--extensions=php',
         '--standard=PSR12',
         '--ignore= src/vendor, src/storage, src/bootstrap, src/resources, src/tests, src/public, src/config, src/app/Helpers/helpers, bin',
         'src'
         ]
       - id: phpstan-subdir
         args: ['src']
         files: ^src/.*\.(php)$
      ```

4. **Now, in your repository you need install the hooks**, with this command:
    ```bash
   pre-commit install
   ```

5. **Add libraries if you need**

    Remember if you use the `.pre-commit-config.yaml` from this example, you need to add in your composer file,
    the libraries:
    - phpstan/phpstan
    - squizlabs/php_codesniffer
   
6. **Run validation manually**

    To run manually you can execute this command in the path where is the code:
    ```bash
    pre-commit run --all-files
    ```

   **Now the hooks validate the next items:**

    - Trim trailing whitespace :heavy_check_mark:
    - Check for merge conflicts :heavy_check_mark:
    - Check JSON format :heavy_check_mark:
    - Check XML format :heavy_check_mark:
    - Check Yaml format :heavy_check_mark:
    - PHP Syntax Check (Quick) :heavy_check_mark:
    - Php CodeSniffer Standard PSR12 :heavy_check_mark:
    - Autofix standard PSR12 with phpcbf :heavy_check_mark:
    - PhpStan with level rule in 4 :heavy_check_mark:

   To run a specific hook, use:
    ```bash
    pre-commit run <hook-id>
    ```
   Example:
    ```bash
    pre-commit run check-json
    ```

## More Information
- [List of supported hooks](https://pre-commit.com/hooks.html)
- [Add custom plugins to my projects](https://pre-commit.com/index.html#plugins)

## Contributing
If you would like to contribute to the pre-commit hooks used in this repository, please follow these steps:

1. Fork the repository.
2. Create a new branch with a descriptive name.
3. Make your changes and update the `.pre-commit-config.yaml` file as needed.
4. Test your changes by running `pre-commit run --all-files`.
5. Submit a pull request with a detailed description of your changes.
