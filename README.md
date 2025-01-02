# GitHub Actions for Okteto

## Automate your development workflows using Github Actions and Okteto

GitHub Actions gives you the flexibility to build automated software development workflows. With GitHub Actions for Okteto you can create workflows to build, deploy and update your applications in [Okteto](https://okteto.com).
Follow [this tutorial](https://okteto.com/docs/cloud/preview-environments/preview-environments-github/) for a full preview environment configuration sample.

Try Okteto for free for 30 days, no credit card required. [Start your 30-day trial now](https://www.okteto.com/free-trial/)!

## Github Action for validating an okteto manifest

You can use this action to run tests in Okteto as part of your automated CI and development workflow.

## Inputs

### `file`

Relative path within the repository to the manifest file (default to okteto.yaml).

## Example usage

This example runs the context action and then runs the tests deploying the dev environment if it hasn't been deployed yet

```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:

  devflow:
    runs-on: ubuntu-latest
    steps:
    - name: "Validate okteto.yml"
      uses: okteto/validate@latest
```