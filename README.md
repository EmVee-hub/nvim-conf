# nvim-conf
EMVEE nvim config.
## Mainly build to work with
- Yaml
- Helm
- HCL ( Terraform/OpenTofu)
- Go
- Java
- Git
- Python

GitHub Actions workflow files under `.github/workflows/` use the GitHub workflow
JSON schema through `yamlls` for YAML validation and completions.

SonarLint is configured for Go, Python, and Java via `sonarlint.nvim`. On startup,
`mason-tool-installer.nvim` checks that `sonarlint-language-server` is installed
and installs it through Mason if needed. You can also run `:MasonToolsInstall`
to install missing tools manually. Java support uses `nvim-jdtls` and the
SonarJava analyzer; Mason installs `jdtls` automatically. JDTLS requires Java 21
to run, which must be installed and available on `PATH`.
